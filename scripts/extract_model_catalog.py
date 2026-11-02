"""Extract a publication-safe offline catalog from the authenticated APK JSON.

Usage: python extract_catalog.py DECODED_JSON OUTPUT_DIR
The decoded input is not included; obtain it from the matching user-owned APK.
This extracts configuration records and never opens a Bluetooth connection.
"""
import argparse
from collections import Counter, defaultdict
import hashlib
import json
from pathlib import Path

APK_SHA256 = 'eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4'
DECODED_SHA256 = '0ef07d3361d4ae3e4bf1e5f6aea5a07ca010af57b6630588fc1f532ae13cc8b9'
PACKAGED_SHA256 = '3acaa7285b85b01ab45906282642b1a27d26b049a6fc368fdd6b1a439c697ba4'
FUNCTION_KEYS = set('''gameMode gameModeList gameSoundList gameSoundMutexes
multiDevicesConnect multiConnectFunctions noiseReductionMode noiseReductionUIVersion
equalizer equalizerMode equalizerModeCompat equalizerModeByVersion customEqualizer
customEqFrequency customEqMax customEqUiVersion highAudio highToneQuality spatialTypes
spatialHiResMutex spatialDescriptionType bassEngineSupport control controlList callControl
incomingCallControl musicControl longPressType longPressVolume supportPinch
controlAutoVolumeSupport wearDetection hearingEnhancement hearingEnhancementNew
hearingJudgeDb fitDetection earScan personalNoise personalNoiseCompat speechPerception
voiceCommand voiceCommandItems headMotion spineHealth whiteNoise zenMode
promptVolume promptVolumePercent promptVolumeRange findDevice heyFindDevice
hideFromUIList sendHostCapabilities mutexFunctions tapLevelSetting vocalEnhance
smartCall aiClearCall longPowerMode batteryInfo inBoxStatus earphoneIdentity
heyTranslate heyTranslateUuid headSetSoundRecord sleepDetection strongNoiseReductionRealTime
utcTimeZone'''.split())

def sanitize(value):
    if isinstance(value, dict):
        return {k: sanitize(v) for k, v in value.items()
                if k != 'packageNameList' and not any(s in k.lower() for s in ('url', 'token', 'secret', 'password'))}
    if isinstance(value, list):
        return [sanitize(v) for v in value]
    if isinstance(value, str) and ('://' in value or ':\\' in value):
        raise ValueError('Unexpected URL/local path in selected configuration')
    return value

def dump(path, obj):
    path.write_text(json.dumps(obj, ensure_ascii=False, indent=2) + '\n', encoding='utf-8', newline='\n')

def build(input_path, output):
    raw = input_path.read_bytes()
    if hashlib.sha256(raw).hexdigest() != DECODED_SHA256:
        raise ValueError('Decoded resource hash does not match the investigated APK')
    data = json.loads(raw)
    models = []
    collection_counts = {}
    for collection in ('compatWhiteList', 'whiteList'):
        rows = data[collection]
        collection_counts[collection] = len(rows)
        for index, row in enumerate(rows):
            model = {k: row[k] for k in ('id', 'name', 'brand', 'type', 'supportSpp', 'uuid', 'minVersion')}
            model['source'] = {'collection': collection, 'index': index}
            model['aliases'] = [child['name'] for child in row.get('children', []) if 'name' in child]
            model['version_fields'] = {k: row[k] for k in ('podsVersion', 'opsPodsVersion', 'heyMelodyVersion') if k in row}
            model['function'] = sanitize({k: v for k, v in row['function'].items() if k in FUNCTION_KEYS})
            model['omitted_function_keys'] = sorted(set(row['function']) - FUNCTION_KEYS)
            model['evidence_level'] = 'apk_configuration_only'
            models.append(model)
    names, ids = defaultdict(list), defaultdict(list)
    for row in models:
        names[row['name']].append(row['id'])
        ids[row['id']].append(row['source'])
    summary = {
        'collections': collection_counts, 'records': len(models),
        'unique_ids': len(ids), 'unique_names': len(names),
        'brands': dict(Counter(r['brand'] for r in models)),
        'types': dict(Counter(r['type'] for r in models)),
        'uuids': dict(Counter(r['uuid'] for r in models)),
        'support_spp_true': sum(r['supportSpp'] is True for r in models),
        'hidden_records': sum(bool(r['function'].get('hideFromUIList')) for r in models),
        'records_with_aliases': sum(bool(r['aliases']) for r in models),
        'aliases': sum(len(r['aliases']) for r in models),
        'duplicate_names': {k:v for k,v in names.items() if len(v)>1},
        'duplicate_ids': {k:v for k,v in ids.items() if len(v)>1},
        'source_root_keys': list(data),
    }
    catalog = {
        'schema_version': 1,
        'source': {'apk_sha256': APK_SHA256, 'package': 'com.heytap.headset',
                   'version_name': '17.6.5', 'resource': 'res/raw/heymelody_app_whitelist.json',
                   'packaged_resource_sha256': PACKAGED_SHA256, 'decoded_resource_sha256': DECODED_SHA256},
        'scope': 'Offline APK configuration catalog, not a released-product list or a hardware compatibility claim',
        'limitations': ['Raw type labels are not numeric productType or protocol IDs.',
                       'Names and aliases are preserved from this APK, not verified marketing names.',
                       'Flags, enums and version gates retain original values; truthiness is not a command capability test.',
                       'Missing fields are unknown, not false. Runtime command capabilities and firmware must be queried separately.',
                       'The SDK still enables only its Free4-specific executable profiles.',
                       'UI package-name lists and unrelated resource/cloud/update fields are omitted.'],
        'summary': summary, 'models': models,
    }
    output.mkdir(parents=True, exist_ok=True)
    dump(output / 'model-catalog.json', catalog)
    dump(output / 'catalog-summary.json', summary)
    return catalog

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded_json', type=Path)
    parser.add_argument('output_dir', type=Path)
    args = parser.parse_args()
    result = build(args.decoded_json, args.output_dir)
    print(json.dumps(result['summary'], ensure_ascii=False))

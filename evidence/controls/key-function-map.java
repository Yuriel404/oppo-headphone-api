    public static int c(Context context, String str, String str2) {
        if (context != null && !TextUtils.isEmpty(str)) {
            try {
                if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_none))) {
                    return 0;
                }
                if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_listening_music))) {
                    return 2;
                }
                if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_play_pause))) {
                    return 1;
                }
                if (!TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_listening_breeno)) && !TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_google_assisant)) && !TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_guide_voice_assistant_title))) {
                    if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_last_song))) {
                        return f.G(str2) ? 4 : 5;
                    }
                    if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_next_song))) {
                        return f.G(str2) ? 5 : 6;
                    }
                    if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_adjust_volume))) {
                        return 7;
                    }
                    if (!TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_sound_noise_switch)) && !TextUtils.equals(str, context.getResources().getString(R.string.melody_common_detail_main_set_noise_reduction))) {
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_play_collection_music))) {
                            return 9;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_switch_song))) {
                            return 10;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_increace_volume))) {
                            return 11;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_decreace_volume))) {
                            return 12;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_switch_device))) {
                            return 13;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_earphone_function_control_game_mode))) {
                            return 17;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_common_earphone_function_control_collect_music))) {
                            return 22;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_zen_mode_title))) {
                            return 18;
                        }
                        if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_ai_summary_title))) {
                            return 25;
                        }
                        if (!TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_guide_reject_the_call)) && !TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_guide_reject_the_call_v2))) {
                            if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_guide_answer_hang_up_the_phone))) {
                                return 29;
                            }
                            if (!TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_ai_translation_application)) && !TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_ai_translation_application_v2))) {
                                if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_ai_translation_real_time_title))) {
                                    return 27;
                                }
                                if (TextUtils.equals(str, context.getResources().getString(com.oplus.melody.spy.R.string.melody_spy_tap_title))) {
                                    return 32;
                                }
                                if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_gmn_control_play_pause_stop_gmn))) {
                                    return 34;
                                }
                                if (TextUtils.equals(str, context.getResources().getString(R.string.melody_ui_gmn_control_trigger_gmn))) {
                                    return 35;
                                }
                            }
                            return 26;
                        }
                        return 28;
                    }
                    return 8;
                }
                return 3;
            } catch (Throwable th) {
                y.h("DeviceControlPreferenceUtils", "getFunctionCommand, error=" + th);
            }
        }
        return -1;
    }

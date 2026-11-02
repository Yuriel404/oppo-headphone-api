"""Offline APK model catalog, separate from executable Free4 profiles.

Records retain configuration values and evidence status; they do not grant
permission or establish compatibility for Bluetooth settings.
"""
from importlib.resources import files
import json


def _catalog() -> dict:
    return json.loads(files("enco_free4").joinpath("data/model-catalog.json").read_text(encoding="utf-8"))


def list_models(query: str = "", *, brand: str | None = None,
                include_hidden: bool = True) -> list[dict]:
    """Search ID, original name and aliases; return fresh configuration records.

    Hidden APK entries are included unless explicitly excluded. A missing flag
    is preserved as missing, and names are not treated as unique identifiers.
    """
    needle = query.casefold().strip()
    result = []
    for model in _catalog()["models"]:
        if brand is not None and model["brand"].casefold() != brand.casefold():
            continue
        if not include_hidden and model["function"].get("hideFromUIList"):
            continue
        searchable = [model["id"], model["name"], *model.get("aliases", [])]
        if needle and not any(needle in value.casefold() for value in searchable):
            continue
        result.append(model)
    return result


def get_model(product_id: str) -> dict:
    """Select exactly one product ID; never guess from a Bluetooth name."""
    matches = [row for row in _catalog()["models"] if row["id"].casefold() == product_id.casefold()]
    if len(matches) != 1:
        raise ValueError(f"expected one catalog record for product ID {product_id!r}; found {len(matches)}")
    return matches[0]


def catalog_summary() -> dict:
    """Return counts and source fingerprints, without Bluetooth operations."""
    data = _catalog()
    return {"source": data["source"], "scope": data["scope"], "summary": data["summary"]}

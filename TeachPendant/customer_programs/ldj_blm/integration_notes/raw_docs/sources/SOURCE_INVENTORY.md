# LDJ Source Inventory

Inventory of raw source files used to build the LDJ integration knowledge base.

| Path | Type | Purpose | Last Used |
|------|------|---------|-----------|
| sources/Esa_Manual_P0122.docx | docx | ESA operator manual; Kvara 560/660W; modes, programme structure | — |
| sources/BLM_MANUAL.docx | docx | BLM/STR press brake use & maintenance; robotic interface optional | — |
| sources/modbus_register_map/*.csv | csv | ESA Modbus register maps (Quick_Reference, Client/Server_Output, etc.) | — |
| Kvara/Exe/ServerModbus.xml | xml | Full 2048-register Modbus map from press | — |
| Kvara/PLC/Iol.inc | inc | PLC signal definitions (C0–C11) | — |
| KVFILE/Ppg.cfg | cfg | Press configuration (model, axes) | — |
| press_brake_reference.md | md | Electrical diagram reference (34-page converted) | — |

| sources/archive/Esa_Manual_extracted.txt | txt | Raw extract from ESA manual (python-docx) | 2025-03 |
| sources/archive/BLM_MANUAL_extracted.txt | txt | Raw extract from BLM manual (zip fallback) | 2025-03 |
| sources/extract_docx.py | py | Extraction script for .docx manuals | — |

**Note:** Kvara/ and KVFILE/ are extracted from the press and are not modified.

**Extraction:** Run `python sources/extract_docx.py` to re-extract manuals. See sources/EXTRACTION_README.md.

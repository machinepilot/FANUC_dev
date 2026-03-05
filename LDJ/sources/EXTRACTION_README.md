# LDJ Manual Extraction

How to extract text from ESA and BLM .docx manuals for the LDJ integration reference.

## Prerequisites

```bash
pip install python-docx
```

## Usage

From the LDJ directory:

```bash
python sources/extract_docx.py
```

## Output

| Source | Output | Method |
|--------|--------|--------|
| Esa_Manual_P0122.docx | archive/Esa_Manual_extracted.txt | python-docx |
| BLM_MANUAL.docx | archive/BLM_MANUAL_extracted.txt | python-docx or zip fallback |

The script tries python-docx first. If BLM_MANUAL.docx fails (e.g. due to large embedded content causing XML parse errors), it falls back to a zip-based extraction that reads `word/document.xml` directly.

## After Extraction

1. Review the extracted files in `sources/archive/`.
2. Update `reference/LDJ_REF_ESA_BLM_Manuals.txt` with any new integration-relevant content.
3. Update `SOURCE_INVENTORY.md` with the extraction date.

## Reference File

The synthesis document `reference/LDJ_REF_ESA_BLM_Manuals.txt` is built from the raw extracts and is the primary reference for:
- Document map (chapter/page refs)
- ESA modes, ram sizing, programme structure
- BLM robotic interface, backgauge, UDP, safety
- Cross-reference to press_brake_reference.md and other LDJ files

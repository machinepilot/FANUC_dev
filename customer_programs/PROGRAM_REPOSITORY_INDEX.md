# Customer Program Repository Index

**Purpose:** Master index for TWA customer FANUC program backups, organized by customer and robot system.

---

## Critical Notice

**These are production backups with known errors and multiple programming philosophies.**

- Do **NOT** treat customer programs as syntax or best-practice reference.
- Use [FANUC_Optimized_Dataset/optimized_dataset/](../FANUC_Optimized_Dataset/optimized_dataset/) for syntax, concepts, and patterns.
- When fixing customer code: preserve application logic; suggest dataset patterns for improvements.

---

## Repository Table

| Customer | Job | Application | Robot | Path | Notes |
|----------|-----|-------------|-------|------|-------|
| PJ Trailers | 345-PJ | Press brake tending | M950iA/500 | [345-PJ/press_brake_tending/](345-PJ/press_brake_tending/) | Tandem press brake; rev_22526 |
| Greenheck Fan | 308-GH | Infeed sort / cart placement | R-30iB Plus, 7-axis E1 | [308-GH/infeed_sort_cart_placement/](308-GH/infeed_sort_cart_placement/) | Slot/Bin/Panel/Foam |
| JD Tube | 313-JD | Tube bending | Tube bending cell | [313-JD/tube_bending/](313-JD/tube_bending/) | Infeed → bender → outfeed |

---

## Quick Links

| Customer | Manifest | Programs |
|----------|----------|----------|
| 345-PJ | [manifest.json](345-PJ/manifest.json) | [rev_22526/](345-PJ/press_brake_tending/rev_22526/) |
| 308-GH | [manifest.json](308-GH/manifest.json) | [programs/](308-GH/infeed_sort_cart_placement/programs/) |
| 313-JD | [manifest.json](313-JD/manifest.json) | [programs/](313-JD/tube_bending/programs/) |

---

## Machine-Readable Manifest

See [_manifest.json](_manifest.json) for the full customer and application-type catalog.

---

## Application Types

| Type | Description |
|------|-------------|
| `press_brake_tending` | Tandem/single press brake load/unload |
| `infeed_sort_cart_placement` | Infeed sort to cart (slot/bin/panel/foam) |
| `tube_bending` | Tube bending cell (infeed → bender → outfeed) |

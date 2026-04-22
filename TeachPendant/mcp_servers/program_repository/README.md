# program_repository

MCP server exposing TeachPendant customer programs and integration notes. Treats `customer_programs/` as read-mostly.

## Install

```bash
uv pip install -e .
```

## Run

```bash
python -m program_repository.server
```

Reads `CUSTOMERS_ROOT` env var (default: `../../customer_programs`).

## Tools

- `list_customers()` - from `_manifest.json`.
- `get_program(customer, name, revision="latest")` - reads a `.LS` / `.KL` / `.TP` / `.PC` from the customer's backups or current working copy. `revision="current"` reads `current/`; `revision="latest"` picks the most recent `backups/<date>/`; `revision="<YYYYMMDD>"` picks that specific dated backup.
- `get_integration_notes(customer)` - returns a list of `{path, title, status, canonical, scope}` for every markdown in `integration_notes/`.
- `search(customer, pattern)` - regex match across TP and KAREL sources.
- `diff(customer, name, rev_a, rev_b)` - structural diff between two revisions (stripped headers, normalized whitespace, line-by-line).
- `list_files(customer, subpath=None)` - list files with kind annotations (`tp_ls`, `tp_bin`, `karel`, `karel_bin`, `markdown`, `pdf`, `other`).

## Integration notes discipline

This is the only MCP tool that returns customer-scoped content. Agents receiving results must remember: `canonical: false`. If a claim from an integration note contradicts canon, canon wins.

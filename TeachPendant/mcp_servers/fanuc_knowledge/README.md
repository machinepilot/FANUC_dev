# fanuc_knowledge

MCP server providing semantic + keyword search over `fanuc_dataset/normalized/`.

## Install

```bash
uv pip install -e .
# or: pip install -e .
```

Optional for semantic search:

```bash
pip install -e '.[embeddings]'
ollama pull nomic-embed-text
```

## Run

```bash
python -m fanuc_knowledge.server
```

Reads `DATASET_ROOT` env var (default: `../fanuc_dataset/normalized`).

## Tools

- `search(query, top_k=5, topic=None, tier=None)` - hybrid keyword + embeddings. Returns `[{id, title, score, snippet, path}]`.
- `get(id)` - full entry as `{frontmatter, body, path}`.
- `list_by_tag(tag)` - topic / controller / language / tier filter.
- `related(id)` - neighbors from `related:` plus inbound references.
- `reindex()` - rebuild the index. Call after ingestion.
- `list_rules()` - enumerate canonical reference entries (prefix `FANUC_REF_`).

## Ollama

Set `EMBEDDING_BACKEND=ollama` to enable semantic search. With `EMBEDDING_BACKEND=none` (default) the server does keyword-only scoring, which is often enough for a small curated dataset.

## Cache

The server keeps an in-memory inverted index and a file-checksum -> embedding map under `.cache/embeddings.json` (gitignored).

---
# Validates against cowork/schemas/handoff.schema.json
schema: handoff
task_id: <uuid>
from_agent: <name>
to_agent: <name>
at: <ISO 8601>
envelope_path: <path to the deliverable this handoff covers>
envelope_schema: <filename under cowork/schemas/>
summary: <one sentence>
open_questions: []
---

# Handoff: <from> -> <to>

## What is ready

- <Artifact 1 path> (schema: <name>)
- <Artifact 2 path>

## What was decided

- <Decision 1> - source: [<entry_id>]
- <Decision 2> - source: [<entry_id>]

## What is still open

- <Question 1> - proposed owner: <agent>

## Notes for the receiving agent

- <Callout or caveat>

## Inputs the receiving agent should read first

1. `<path>` (start here)
2. `<path>`
3. `<path>`

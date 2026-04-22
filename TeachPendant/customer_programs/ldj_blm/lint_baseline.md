# LDJ-BLM Lint Baseline

Baseline static-analysis findings against `fanuc_safety_lint` rules catalog. Produced from `backups/latest/**/*.LS` at migration time. Subsequent lint runs diff against this file; any new finding is a regression that must be addressed before release.

Generated: 2026-04-22 06:24
Files scanned: 93

## Rules Applied

See `mcp_servers/fanuc_safety_lint/README.md`. Key matchers used in this baseline:

- FANUC-UTL-001 (high): UTool/UFrame not set before first motion
- FANUC-WAIT-001 (high): WAIT on input without TIMEOUT branch
- FANUC-SKIP-001 (high): SKIP CONDITION without LBL receiver
- FANUC-OV-001 (critical): Programmatic override modification
- FANUC-COND-001 (high): MONITOR without MONITOR END
- FANUC-ALIAS-001 (medium): Raw DI/DO without aliased signal name
- FANUC-PR-001 (medium): Motion uses P[n] without comment
- FANUC-DCS-001 (info): Motion detected (reminder for Safety agent)
- FANUC-BG-001 (high): Background Logic contains motion
- FANUC-UOP-001 (high): PROD_START without ENBL handshake

## Per-file findings

| File | Critical | High | Medium | Low | Info |
|------|---------:|-----:|-------:|----:|-----:|
| ADJ_BG.LS | 0 | 0 | 5 | 0 | 1 |
| ADJ_BG_R01.LS | 0 | 0 | 0 | 0 | 1 |
| BEND.LS | 0 | 0 | 2 | 0 | 0 |
| BG_LOGIC.LS | 0 | 0 | 7 | 0 | 0 |
| BG_LOGIC_R01.LS | 0 | 0 | 3 | 0 | 0 |
| CHANGE_TOOLS.LS | 0 | 0 | 4 | 0 | 1 |
| CHANGE_TOOLS_R01.LS | 0 | 0 | 0 | 0 | 1 |
| END_PART.LS | 0 | 0 | 1 | 0 | 0 |
| GO_HOME.LS | 0 | 0 | 0 | 0 | 1 |
| GO_HOME_R01.LS | 0 | 0 | 0 | 0 | 1 |
| GO_MAINTENANCE.LS | 0 | 0 | 0 | 0 | 1 |
| GO_MAINTENANCE_R01.LS | 0 | 0 | 0 | 0 | 1 |
| GO_ZERO.LS | 0 | 0 | 0 | 0 | 1 |
| GO_ZERO_R01.LS | 0 | 0 | 0 | 0 | 1 |
| OPEN_PRESS.LS | 0 | 1 | 5 | 0 | 0 |
| PINCH.LS | 0 | 1 | 6 | 0 | 0 |
| PNS0001.LS | 0 | 0 | 49 | 0 | 1 |
| PNS0001_R01.LS | 0 | 0 | 49 | 0 | 1 |
| PNS0002.LS | 0 | 0 | 34 | 0 | 1 |
| PNS0002_R01.LS | 0 | 0 | 34 | 0 | 1 |
| PNS0003.LS | 0 | 0 | 35 | 0 | 1 |
| PNS0003_R01.LS | 0 | 0 | 35 | 0 | 1 |
| PNS0004.LS | 0 | 0 | 92 | 0 | 1 |
| PNS0004_R01.LS | 0 | 0 | 92 | 0 | 1 |
| PNS0005.LS | 0 | 0 | 35 | 0 | 1 |
| PNS0005_R01.LS | 0 | 0 | 35 | 0 | 1 |
| PRE_BG.LS | 0 | 0 | 1 | 0 | 0 |
| SEARCH.LS | 0 | 2 | 1 | 0 | 1 |
| SEARCH_R01.LS | 0 | 2 | 0 | 0 | 1 |
| START_PART.LS | 0 | 0 | 1 | 0 | 0 |
| TOOL_LOCK.LS | 0 | 0 | 1 | 0 | 0 |
| TOOL_UNLOCK.LS | 0 | 0 | 1 | 0 | 0 |
| ZERO.LS | 0 | 2 | 0 | 0 | 1 |
| 41526_LSfiles backup\ADJ_BG.LS | 0 | 0 | 5 | 0 | 1 |
| 41526_LSfiles backup\BEND.LS | 0 | 0 | 2 | 0 | 0 |
| 41526_LSfiles backup\BG_LOGIC.LS | 0 | 0 | 7 | 0 | 0 |
| 41526_LSfiles backup\CHANGE_TOOLS.LS | 0 | 0 | 4 | 0 | 1 |
| 41526_LSfiles backup\END_PART.LS | 0 | 0 | 1 | 0 | 0 |
| 41526_LSfiles backup\GO_HOME.LS | 0 | 0 | 0 | 0 | 1 |
| 41526_LSfiles backup\GO_MAINTENANCE.LS | 0 | 0 | 0 | 0 | 1 |
| 41526_LSfiles backup\GO_ZERO.LS | 0 | 0 | 0 | 0 | 1 |
| 41526_LSfiles backup\OPEN_PRESS.LS | 0 | 1 | 5 | 0 | 0 |
| 41526_LSfiles backup\PINCH.LS | 0 | 1 | 6 | 0 | 0 |
| 41526_LSfiles backup\PNS0001.LS | 0 | 0 | 49 | 0 | 1 |
| 41526_LSfiles backup\PNS0002.LS | 0 | 0 | 34 | 0 | 1 |
| 41526_LSfiles backup\PNS0003.LS | 0 | 0 | 35 | 0 | 1 |
| 41526_LSfiles backup\PNS0004.LS | 0 | 0 | 92 | 0 | 1 |
| 41526_LSfiles backup\PNS0005.LS | 0 | 0 | 35 | 0 | 1 |
| 41526_LSfiles backup\PRE_BG.LS | 0 | 0 | 1 | 0 | 0 |
| 41526_LSfiles backup\SEARCH.LS | 0 | 2 | 1 | 0 | 1 |
| 41526_LSfiles backup\START_PART.LS | 0 | 0 | 1 | 0 | 0 |
| 41526_LSfiles backup\TOOL_LOCK.LS | 0 | 0 | 1 | 0 | 0 |
| 41526_LSfiles backup\TOOL_UNLOCK.LS | 0 | 0 | 1 | 0 | 0 |
| 41526_LSfiles backup\ZERO.LS | 0 | 2 | 0 | 0 | 1 |
| manual programs\M_07051.LS | 0 | 0 | 8 | 0 | 1 |
| manual programs\M_08780.LS | 0 | 0 | 8 | 0 | 1 |
| manual programs\M_0964.LS | 0 | 0 | 8 | 0 | 1 |
| manual programs\M_0965.LS | 0 | 0 | 8 | 0 | 1 |
| manual programs\M_15304.LS | 0 | 0 | 8 | 0 | 1 |
| manual programs\M_6410808783.LS | 0 | 0 | 18 | 0 | 1 |
| manual programs\M_6410816256.LS | 0 | 0 | 21 | 0 | 1 |
| manual programs\M_6410817074.LS | 0 | 0 | 17 | 0 | 1 |
| manual programs\M_6410818389.LS | 0 | 0 | 17 | 0 | 1 |
| manual programs\M_6410820756.LS | 0 | 0 | 21 | 0 | 1 |

## Totals

| Severity | Count |
|----------|------:|
| critical | 0 |
| high | 14 |
| medium | 942 |
| low | 0 |
| info | 45 |

## Notes

The `info`-grade FANUC-DCS-001 count equals the number of motion-bearing programs scanned; this is expected. Treat as a reminder for the Safety agent to cover the DCS envelope explicitly, not as a regression.

Raw DI/DO / P[n]-without-comment findings (`medium`) are partly a function of the customer's local convention. Document the deviation in `README.md` **Local Conventions** before closing individual findings as 'acceptable for LDJ-BLM'.

Critical findings (if any) block the `ldj_blm_continuation` workflow until a human signoff under `task_state.safety.signoff` is recorded.

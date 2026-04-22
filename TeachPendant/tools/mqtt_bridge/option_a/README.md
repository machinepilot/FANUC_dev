# Option A: JSON over TCP + Bridge

Karel sends JSON over TCP to a bridge process; the bridge publishes to Mosquitto.

## Components

| File | Purpose |
|------|---------|
| `MQTT_BRIDGE.kl` | Karel program — connects to C1 (port 5000), sends JSON |
| `bridge.py` | Python bridge — listens on 5000, publishes to localhost:1883 |

## FANUC Setup

- **Host Comm → Client 1 (C1)**:
  - IP: WAGO Touch Panel IP (e.g., 192.168.1.10)
  - Port: **5000**
  - Protocol: SM (Socket Messaging)
  - STATE: STARTED

## WAGO Setup

1. Start Mosquitto broker (port 1883).
2. Run bridge: `python3 bridge.py --port 5000`
3. Ensure port 5000 is open for FANUC connections.

## Test

1. Run `MQTT_BRIDGE` from FANUC TP.
2. On WAGO: `mosquitto_sub -h localhost -t robot/position -v`
3. Verify JSON with `"opt":"A"` in payload.

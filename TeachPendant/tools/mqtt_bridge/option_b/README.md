# Option B: Native MQTT in Karel

Karel implements MQTT 3.1.1 wire format and connects directly to Mosquitto. No bridge required.

## Components

| File | Purpose |
|------|---------|
| `MQTT_NATIVE.kl` | Karel program — connects to C2 (port 1883), sends MQTT CONNECT + PUBLISH |

## FANUC Setup

- **Host Comm → Client 2 (C2)**:
  - IP: WAGO Touch Panel IP (e.g., 192.168.1.10)
  - Port: **1883**
  - Protocol: SM (Socket Messaging)
  - STATE: STARTED

## WAGO Setup

1. Start Mosquitto broker (port 1883).
2. No bridge needed — Karel connects directly to Mosquitto.
3. Ensure port 1883 is open for FANUC connections.

## Test

1. Run `MQTT_NATIVE` from FANUC TP.
2. On WAGO: `mosquitto_sub -h localhost -t robot/position -v`
3. Verify JSON with `"opt":"B"` in payload.

## Protocol Notes

- MQTT 3.1.1 CONNECT with client ID "fanuc_robot"
- PUBLISH to topic "robot/position" with QoS 0
- Payload limited to ~256 bytes (JSON)

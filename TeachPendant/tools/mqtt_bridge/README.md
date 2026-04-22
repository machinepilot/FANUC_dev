# FANUC MQTT Integration — Options A and B

Two deployable approaches for sending robot data (joint positions, etc.) to an MQTT broker on a WAGO Touch Panel 600.

## Quick Comparison

| Aspect | Option A | Option B |
|--------|----------|----------|
| **Approach** | JSON over TCP + bridge | Native MQTT in Karel |
| **FANUC Client** | C1 (port 5000) | C2 (port 1883) |
| **WAGO Bridge** | Required (Python) | Not required |
| **Karel Complexity** | Low | High |
| **Payload Marker** | `"opt":"A"` | `"opt":"B"` |

## Folder Structure

```
mqtt_bridge/
├── option_a/           # JSON over TCP + bridge
│   ├── MQTT_BRIDGE.kl
│   ├── bridge.py
│   ├── requirements.txt
│   └── README.md
├── option_b/           # Native MQTT
│   ├── MQTT_NATIVE.kl
│   └── README.md
├── setup/
│   ├── FANUC_SETUP.md  # Teach pendant, Host Comm, Karel
│   └── WAGO_SETUP.md   # Mosquitto, bridge, systemd
└── README.md
```

## Quick Start

### Option A

1. **WAGO**: Start Mosquitto, then `python3 option_a/bridge.py`
2. **FANUC**: Configure C1 (WAGO IP, 5000), load `MQTT_BRIDGE`, run
3. **Verify**: `mosquitto_sub -h localhost -t robot/position -v`

### Option B

1. **WAGO**: Start Mosquitto
2. **FANUC**: Configure C2 (WAGO IP, 1883), load `MQTT_NATIVE`, run
3. **Verify**: `mosquitto_sub -h localhost -t robot/position -v`

## Setup Guides

- [FANUC Setup](setup/FANUC_SETUP.md) — Host Comm, Karel load, troubleshooting
- [WAGO Setup](setup/WAGO_SETUP.md) — Mosquitto, bridge, firewall, systemd

## Side-by-Side Testing

Both options publish to the same topic `robot/position`. Use the `opt` field to distinguish:

- Option A: `"opt":"A"`
- Option B: `"opt":"B"`

Run one option at a time, or use different topics if testing both simultaneously.

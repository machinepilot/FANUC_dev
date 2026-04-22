# WAGO Touch Panel 600 Setup for MQTT Options A and B

## Overview

- **Mosquitto** runs on WAGO (port 1883) — required for both options.
- **Bridge** (Option A only) runs on WAGO (port 5000) — receives JSON from FANUC, publishes to Mosquitto.

---

## 1. Install Mosquitto Broker

### Native Installation

See [WAGO pfc-howtos - Add Mosquitto Broker](https://github.com/WAGO/pfc-howtos/blob/master/HowTo_AddMosquittoBroker/README.md).

### Docker (if supported)

```bash
docker run -d --name mosquitto -p 1883:1883 eclipse-mosquitto
```

### Verify

```bash
mosquitto_sub -h localhost -t '#' -v
```

Leave running; you should see messages when FANUC publishes.

---

## 2. Option A: Bridge Setup

### Install Python 3 and paho-mqtt

```bash
# If using opkg or similar on WAGO
opkg update
opkg install python3 python3-pip
pip3 install paho-mqtt

# Or with requirements.txt
pip3 install -r option_a/requirements.txt
```

### Run Bridge

```bash
cd /path/to/mqtt_bridge/option_a
python3 bridge.py --host 0.0.0.0 --port 5000 --mqtt-host localhost --mqtt-port 1883
```

### Systemd Service (auto-start)

Create `/etc/systemd/system/fanuc-mqtt-bridge.service`:

```ini
[Unit]
Description=FANUC Option A MQTT Bridge
After=network.target mosquitto.service

[Service]
Type=simple
ExecStart=/usr/bin/python3 /opt/mqtt_bridge/option_a/bridge.py --host 0.0.0.0 --port 5000
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

```bash
systemctl daemon-reload
systemctl enable fanuc-mqtt-bridge
systemctl start fanuc-mqtt-bridge
```

---

## 3. Firewall

Allow incoming connections from FANUC robot IP:

- **Port 5000** (Option A): FANUC → bridge
- **Port 1883** (Option B): FANUC → Mosquitto

```bash
# Example with iptables (adjust interface and IP)
iptables -A INPUT -p tcp --dport 5000 -s 192.168.1.20 -j ACCEPT
iptables -A INPUT -p tcp --dport 1883 -s 192.168.1.20 -j ACCEPT
```

---

## 4. Test Sequence

### Option A

1. Start Mosquitto.
2. Start bridge: `python3 bridge.py`
3. On another terminal: `mosquitto_sub -h localhost -t robot/position -v`
4. Run MQTT_BRIDGE on FANUC.
5. Verify JSON appears in mosquitto_sub.

### Option B

1. Start Mosquitto.
2. `mosquitto_sub -h localhost -t robot/position -v`
3. Run MQTT_NATIVE on FANUC.
4. Verify JSON appears.

---

## 5. Network Summary

| Component | Port | Direction |
|-----------|------|-----------|
| Mosquitto | 1883 | FANUC (Option B) → WAGO |
| Bridge | 5000 | FANUC (Option A) → WAGO |
| Bridge → Mosquitto | 1883 | localhost (internal) |

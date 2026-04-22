# FANUC Setup for MQTT Options A and B

## Prerequisites

- **R648 User Socket Message** option enabled on the controller.
- Robot and WAGO on same network (e.g., 192.168.1.x).

---

## 1. Verify R648 Option

1. **MENU** → **Setup** → **System** → **Version ID** (or **Controlled Start**)
2. Confirm **R648: User Socket Message** is listed.
3. If missing, add via Controlled Start (requires appropriate license).

---

## 2. Host Communication Configuration

**MENU** → **Setup** → **Host Comm** → **Client**

### Option A (JSON + Bridge)

| Field | Value |
|-------|-------|
| **Client** | 1 (C1) |
| **STATE** | STARTED |
| **IP Address** | WAGO Touch Panel IP (e.g., 192.168.1.10) |
| **Port** | **5000** |
| **Protocol** | SM (Socket Messaging) |

### Option B (Native MQTT)

| Field | Value |
|-------|-------|
| **Client** | 2 (C2) |
| **STATE** | STARTED |
| **IP Address** | WAGO Touch Panel IP (e.g., 192.168.1.10) |
| **Port** | **1883** |
| **Protocol** | SM (Socket Messaging) |

**Important:** STATE must be **STARTED**, not just DEFINED. MSG_CONNECT will fail otherwise.

---

## 3. Load Karel Programs

### Compile on PC (RoboGuide or Karel compiler)

1. Open `option_a/MQTT_BRIDGE.kl` or `option_b/MQTT_NATIVE.kl`.
2. Compile to produce `.pc` file.
3. Transfer `.pc` to controller (FTP to `/md:` or USB).

### Load on Teach Pendant

1. **MENU** → **FILE** → **UTIL**
2. Select device (e.g., MD: or USB:).
3. **LOAD** → select `.pc` file.
4. Load to default or specified location.

### Verify

1. **MENU** → **SELECT** → **Type** → **All** or **KAREL**
2. Confirm `MQTT_BRIDGE` and/or `MQTT_NATIVE` appear in program list.

---

## 4. Run and Test

### Option A

1. Ensure WAGO bridge is running (`python3 bridge.py`).
2. Run **MQTT_BRIDGE** from TP.
3. Check message line for "Sent successfully" or error codes.

### Option B

1. Ensure Mosquitto is running on WAGO (port 1883).
2. Run **MQTT_NATIVE** from TP.
3. Check message line for "Published" or error codes.

### Error Codes

- **MSG_CONNECT failed**: Check Host Comm (IP, port, STATE=STARTED), network, firewall.
- **OPEN FILE failed**: Connection established but file handle error; check R648.
- **WRITE failed**: Socket closed or network issue.

---

## 5. Optional: Call from TP Program

```
  1:  !Send position to MQTT (Option A)
  2:  CALL MQTT_BRIDGE ;
  3:  !Or Option B
  4:  !CALL MQTT_NATIVE ;
```

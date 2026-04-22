#!/usr/bin/env python3
"""
Option A: FANUC Robot TCP to MQTT Bridge

Listens for TCP connections from the FANUC MQTT_BRIDGE.kl program (Option A),
receives JSON payloads (joint positions, etc.), and publishes them to Mosquitto.

Usage:
    python bridge.py [--host 0.0.0.0] [--port 5000] [--mqtt-host localhost] [--mqtt-port 1883] [--topic robot/position]

Prerequisites:
    pip install paho-mqtt
"""

import argparse
import json
import socket
import sys
from datetime import datetime

try:
    import paho.mqtt.client as mqtt
except ImportError:
    print("Error: paho-mqtt not installed. Run: pip install paho-mqtt")
    sys.exit(1)


def parse_args():
    parser = argparse.ArgumentParser(description="Option A: FANUC TCP to MQTT Bridge")
    parser.add_argument("--host", default="0.0.0.0", help="TCP listen address (default: 0.0.0.0)")
    parser.add_argument("--port", type=int, default=5000, help="TCP listen port (default: 5000)")
    parser.add_argument("--mqtt-host", default="localhost", help="MQTT broker host (default: localhost)")
    parser.add_argument("--mqtt-port", type=int, default=1883, help="MQTT broker port (default: 1883)")
    parser.add_argument("--topic", default="robot/position", help="MQTT topic (default: robot/position)")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose logging")
    return parser.parse_args()


def main():
    args = parse_args()

    # MQTT client
    mqtt_client = mqtt.Client()
    try:
        mqtt_client.connect(args.mqtt_host, args.mqtt_port, 60)
    except Exception as e:
        print(f"Error: Cannot connect to MQTT broker at {args.mqtt_host}:{args.mqtt_port}: {e}")
        sys.exit(1)

    mqtt_client.loop_start()

    # TCP server
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    try:
        sock.bind((args.host, args.port))
    except OSError as e:
        print(f"Error: Cannot bind to {args.host}:{args.port}: {e}")
        sys.exit(1)

    sock.listen(1)
    print(f"[Option A] Bridge listening on {args.host}:{args.port}")
    print(f"[Option A] MQTT broker: {args.mqtt_host}:{args.mqtt_port}, topic: {args.topic}")
    print("Waiting for robot connections...")

    while True:
        try:
            conn, addr = sock.accept()
            data = b""
            while True:
                chunk = conn.recv(1024)
                if not chunk:
                    break
                data += chunk
                if b"\n" in data or b"\r" in data:
                    break
            conn.close()

            payload = data.decode("utf-8", errors="replace").strip()
            if not payload:
                if args.verbose:
                    print(f"[{datetime.now().isoformat()}] Empty payload from {addr}")
                continue

            # Validate JSON
            try:
                parsed = json.loads(payload)
            except json.JSONDecodeError as e:
                print(f"[{datetime.now().isoformat()}] Invalid JSON from {addr}: {e}")
                continue

            # Publish to MQTT
            result = mqtt_client.publish(args.topic, payload, qos=0)
            if result.rc == mqtt.MQTT_ERR_SUCCESS:
                if args.verbose:
                    print(f"[{datetime.now().isoformat()}] Published from {addr}: {payload[:80]}...")
            else:
                print(f"[{datetime.now().isoformat()}] MQTT publish failed (rc={result.rc}) from {addr}")

        except KeyboardInterrupt:
            print("\nShutting down...")
            break
        except Exception as e:
            print(f"[{datetime.now().isoformat()}] Error: {e}")

    sock.close()
    mqtt_client.loop_stop()
    mqtt_client.disconnect()


if __name__ == "__main__":
    main()

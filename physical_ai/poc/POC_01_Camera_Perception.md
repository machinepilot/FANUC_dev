# POC 01: Camera-Based Object Perception

*First proof of concept — object detection and pose estimation on Jetson Orin Nano*

---

## Camera: e-CAM121_CUONX on CAM1

Development camera is the **e-CAM121_CUONX** (12.3MP, Sony IMX412) connected to **CAM1** on the Jetson Orin Nano. See `physical_ai/hardware/e_cam121/` for setup, verification, and GStreamer/Argus usage.

---

## Objective

Validate the perception pipeline on Jetson Orin Nano using the e-CAM121_CUONX (CAM1) or other attached camera. Establish baseline for AI-driven part detection relevant to existing customer applications.

---

## Success Criteria

- [ ] Camera captures images and publishes to ROS 2 topic
- [ ] At least one perception node runs (e.g., OpenCV-based detection or Isaac ROS apriltag/centerpose)
- [ ] Pose or bounding box output visible (RViz or console)
- [ ] Documented setup and any part-specific tuning

---

## Prerequisites

- Jetson Orin Nano with JetPack 6.x
- **e-CAM121_CUONX on CAM1** (see `physical_ai/hardware/e_cam121/`) or USB/CSI camera
- Isaac ROS Dev environment (or native ROS 2 Humble)

---

## Steps

### 1. Camera Verification

**e-CAM121_CUONX (CAM1)**:

```bash
sudo dmesg | grep -i "Detected eimx412 sensor"
ls /dev/video*
eCAM_argus_camera --device=0   # Sample app
```

**Generic**:

```bash
v4l2-ctl --list-devices
# Ensure /dev/video0 or similar is present
```

### 2. Run Simple Image Pipeline

- Launch camera driver node (e.g., `usb_cam`, `v4l2_camera`)
- Verify `/camera/image_raw` (or equivalent) topic
- View in RViz2 or `rqt_image_view`

### 3. Add Perception

**Option A — Simple (OpenCV + Python)**:
- Subscribe to image topic
- Run basic color/contour detection or template matching
- Publish result (e.g., bounding box, pose)

**Option B — Isaac ROS**:
- Run `isaac_ros_apriltag` for tag detection
- Or `isaac_ros_centerpose` / `foundationpose` for 6D pose (if supported on Orin Nano)

### 4. Collect Real Data

- Capture images of parts relevant to:
  - **308-GH**: Infeed sort / cart placement parts
  - **345-PJ**: Press brake parts
  - **313-JD**: Tube bending parts
- Label for future model training (as Murali emphasized: "value the data")

---

## Alignment with Customer Work

| Customer | Application | Perception Use Case |
|----------|-------------|---------------------|
| 308-GH | Infeed sort | Part classification, sort destination |
| 345-PJ | Press brake | Part pose for flexible fixturing |
| 313-JD | Tube bending | Tube position/orientation |

---

## Notes

- Start simple; add complexity once baseline works
- Document lighting, camera position, and part variability
- Plan data collection format for reuse in training

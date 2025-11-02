# 🚨 Azure VM CPU Utilization Alert Monitoring using Azure Monitor

**Author:** Pranav Chaithanya

---

## 📌 Project Overview
This project demonstrates monitoring of an Azure Virtual Machine (Ubuntu) using **Azure Monitor**.
A CPU utilization alert rule is configured that triggers an email notification when the CPU usage exceeds a defined threshold.
This repo contains implementation steps, the stress test script used to trigger the alert, an architecture diagram and placeholders for screenshots.

---

## 📚 Contents
```
azure-vm-cpu-alert-monitoring/
├─ README.md
├─ LICENSE
├─ .gitignore
├─ architecture/architecture.svg
├─ scripts/stress-cpu.sh
└─ screenshots/
   ├─ vm-overview.png
   ├─ alert-creation.png
   ├─ cpu-graph.png
   └─ email-alert.png
```

---

## ✅ Quick Summary
**Implemented Alerts**
- CPU Utilization Alert (Percentage CPU) → Example: `> 60%` (Average over 5 minutes)
- Action Group for Email Notification

**Stress test script (Linux)**
- `scripts/stress-cpu.sh` (runs `stress --cpu 4 --timeout 300`)

---

## 🧭 Step-by-step Implementation (What to demonstrate to faculty)

### 1. Create Azure Virtual Machine
1. Go to Azure Portal → **Virtual Machines** → **Create**.
2. Configure: Region, Image (Ubuntu 22.04 LTS), VM size (Standard B1s or higher), Authentication (password or SSH).
3. Create and wait for deployment to finish.

### 2. Enable Monitoring / Diagnostics
1. Go to the VM resource → **Extensions + applications**.
2. Install **Azure Monitor Agent / AzureMonitorLinuxAgent** (or enable Insights).
3. Wait a few minutes for metrics to populate.

### 3. Create Action Group (Notification)
1. Azure Portal → **Action Groups** → **Create**.
2. Name: `CPU-Alert-Group` (example).
3. Add a notification type: **Email/SMS/Push** → Enter your email.
4. Create and save.

### 4. Create CPU Alert Rule
1. VM → **Monitoring → Alerts** → **+ Create → Alert rule**.
2. Scope: Select the VM resource.
3. Condition → Add condition:
   - Signal name: **Percentage CPU** (or `CPU Percentage`)
   - Condition: **Greater than**
   - Threshold: **60** (means 60%)
   - Aggregation: **Average** over **5 minutes**
4. Actions → Select the `CPU-Alert-Group` action group created earlier.
5. Details → Alert name: `High-CPU-Alert`, Severity: `2 (Warning)`.
6. Create the alert rule.

### 5. Trigger CPU Load (Demo)
Use **Run Command** in Azure Portal (no SSH required):
1. VM → **Run command** → **RunShellScript**.
2. Paste the content of `scripts/stress-cpu.sh` and run.

**scripts/stress-cpu.sh**:
```bash
#!/bin/bash
sudo apt update -y
sudo apt install stress -y
stress --cpu 4 --timeout 300
```

This command will run CPU stress for 300 seconds (5 minutes), creating a visible spike in CPU metrics and should trigger the alert if threshold is crossed.

### 6. Verify & Capture Evidence
1. VM → **Metrics** → Choose **CPU Percentage** → Observe the spike in graph.
2. Azure Portal → **Monitor → Alerts → Active alerts** OR VM → **Monitoring → Alerts** → Check **Activated** alert.
3. Open your registered email → Look for Azure alert notification mail (subject like `Fired: High-CPU-Alert`).

Capture the following screenshots for your submission (place them in `/screenshots/`):
- `vm-overview.png` — VM details page
- `alert-creation.png` — Alert rule config screen
- `cpu-graph.png` — Metric spike
- `email-alert.png` — Received notification email

---

## 🗂 Files in this repo
- `scripts/stress-cpu.sh` — Stress script (Linux)
- `architecture/architecture.svg` — Architecture diagram (detailed)
- `screenshots/` — Placeholder images for you to replace with real screenshots

---

## ✨ Notes & Tips
- Adjust the CPU alert threshold to suit your VM size and demonstration needs.
- If alerts don't fire, ensure VM Insights / Azure Monitor Agent is installed and the Action Group email is verified.
- For Windows VMs, use a PowerShell stress script (`cpu_stress_windows.ps1`) instead.

---

## Author
Pranav Chaithanya

---

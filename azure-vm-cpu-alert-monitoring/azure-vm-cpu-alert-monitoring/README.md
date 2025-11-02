

# 🚨 Azure VM CPU Utilization Alert Monitoring using Azure Monitor


---

## 📌 Project Overview

This project demonstrates real-time monitoring of an Azure Virtual Machine (Ubuntu) using **Azure Monitor**.
A CPU utilization alert rule is configured that sends an **email notification** when CPU usage exceeds a defined threshold.
This repository includes implementation steps, stress test scripts, architecture diagrams, and example screenshots.

---


## 🧭 Step-by-Step Implementation

### 1️⃣ Create Azure Virtual Machine

1. Go to **Azure Portal → Virtual Machines → + Create → Azure Virtual Machine**.
2. Configure:

   * **Region:** Select closest region
   * **Image:** Ubuntu 22.04 LTS
   * **Size:** Standard B1s (or higher)
   * **Authentication:** Password or SSH
3. Review + Create → Wait for deployment to complete.
4. Once deployed → Open the VM → Verify it is **Running**.

---

### 2️⃣ Configure CPU Alert Rule via Azure Monitor

> ✅ Important: The alert rule is created from **Azure Monitor**, not directly from the VM.

1. In Azure Portal, search **“Monitor”** → Open **Azure Monitor**.
2. In the left panel → Click **Alerts** → Then **+ Create → Alert rule**.

#### **Step 1: Select Scope**

* Choose **Select resource** → Pick your **VM**, verify the correct **Resource Group** and **Region**.
* Click **Next: Condition**.

#### **Step 2: Define Condition**

* Click **Add condition** → Select signal **Percentage CPU**.
* Configure:

  * **Condition type:** Greater than
  * **Threshold:** 60
  * **Aggregation type:** Average
  * **Aggregation granularity:** 5 minutes
* Click **Done** → Proceed to **Next: Actions**.

#### **Step 3: Add Action Group**

* Click **+ Create Action Group** →

  * Name: `CPU-Alert-Group`
  * Notification type: **Email/SMS/Push/Voice** → Enter your **Email ID**.
  * Save → Select this Action Group for the alert.

#### **Step 4: Alert Details**

* Alert Rule Name: `High-CPU-Alert`
* Severity: `2 (Warning)`
* Description: Trigger when CPU usage > 60%
* Click **Review + Create → Create** ✅

---

### 3️⃣ Trigger CPU Load (Stress Test)

Use **Run Command** directly from Azure Portal (no SSH needed):

1. Go to your **VM → Run command (left panel)**.
2. Choose **RunShellScript** (for Linux VMs).
3. Paste and run the below commands 👇

```bash
sudo apt update -y
sudo apt install stress -y
stress --cpu 4 --timeout 300
```

This will stress the CPU for **5 minutes**, creating a visible CPU spike in Azure Monitor.

---

### 4️⃣ Verify Alerts Firing

1. After a few minutes → Go to **Monitor → Alerts → Alert rules**.
2. Click on your rule `High-CPU-Alert`.
3. Under **Alerts (fired)**, you should see **Status: Fired** (active alert).
4. Click the alert to view details like start time, affected resource, and severity.

---

### 5️⃣ Check CPU Metrics Graph

1. In **Monitor → Metrics**, select your **VM** as the resource.
2. Metric name: **Percentage CPU**.
3. Set **Time range:** Last 30 minutes.
4. You should see a clear CPU usage spike matching your stress test.

---

### 6️⃣ Confirm Email Notification

Open your registered **email inbox** — you should see a mail from **Azure Monitor** with the subject:
**“Fired: High-CPU-Alert”**.
This confirms that the alert was successfully triggered and the notification was sent.


---

## 🧠 Summary

✅ Created a Virtual Machine
✅ Configured CPU Utilization alert via Azure Monitor
✅ Triggered CPU spike using stress test
✅ Verified alert in Azure Monitor
✅ Received notification email successfully




##  ✅ Conclusion 

The project was successfully completed.
Azure Monitor effectively tracked the VM’s CPU utilization, triggered alerts when thresholds were exceeded, and sent email notifications through the configured Action Group — confirming the alert system works as intended.


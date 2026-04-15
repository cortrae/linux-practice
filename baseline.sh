#!/bin/bash

#System Baseline Capture
#Author: Cortrae Wiggins

echo "==============================="
echo "System Baseline Report"
echo "$(hostname)"
echo "$(date)"
echo "=============================="
echo ""

echo "[*] Capturing running processes..."
ps aux > baseline_processes.txt

echo "[*] Capturing open ports..."
ss -tuln > baseline_ports.txt

echo "[*] Capturing users..."
who > baseline_users.txt

echo "[*] Capturing disk usage..."
df  -h > baseline_disk.txt

echo "[*] Capturing failed logins..."
grep "Failed password" /var/log/auth.log | wc -l > baseline_auth.txt

echo "======================================================================================================================================================================"
echo "Baseline captured; stored in baseline_processes.txt, baseline_ports.txt, baseline_users.txt, baseline_disk.txt, and baseline_auth.txt"
echo "========================================================================================"

#!/bin/bash
# System Baseline Capture
# Author: Cortrae Wiggins

echo "========================================="
echo " System Baseline Report"
echo " Host: $(hostname)"
echo " Date: $(date)"
echo "========================================="
echo ""

# Capture all running processes - new or unknown processes can indicate malware or compromise
echo "[*] Capturing running processes..."
ps aux > baseline_processes.txt

# Capture open ports - new listening services can indicate backdoors or unauthorized software
echo "[*] Capturing open ports..."
ss -tuln > baseline_ports.txt

# Capture logged in users - unexpected users can indicate unauthorized access
echo "[*] Capturing users..."
who > baseline_users.txt

# Capture disk usage - unusual growth can indicate data exfiltration or malware activity
echo "[*] Capturing disk usage..."
df -h > baseline_disk.txt

# Capture failed login count - high count can indicate a brute force attack in progress
echo "[*] Capturing failed logins..."
grep "Failed password" /var/log/auth.log | wc -l > baseline_auth.txt

echo "========================================="
echo " BASELINE COMPLETE"
echo "========================================="
echo " baseline_processes.txt"
echo " baseline_ports.txt"
echo " baseline_users.txt"
echo " baseline_disk.txt"
echo " baseline_auth.txt"
echo "========================================="

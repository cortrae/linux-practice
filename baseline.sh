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


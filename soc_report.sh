#!/bin/bash
# SOC Master Report - Runs all detection scripts and outputs unified report
# Author: Cortrae Wiggins

echo "================================================"
echo "         SOC HOME LAB - MASTER REPORT"
echo "================================================"
echo "Generated: $(date)"
echo "Host: $(hostname)"
echo ""

echo "------------------------------------------------"
bash /home/cortrae/linux_practice/auth_monitor.sh
echo ""

echo "------------------------------------------------"
bash /home/cortrae/linux_practice/sudo_monitor.sh
echo ""

echo "------------------------------------------------"
bash /home/cortrae/linux_practice/login_report.sh
echo ""

echo "------------------------------------------------"
bash /home/cortrae/linux_practice/port_scan_detect.sh
echo ""

echo "================================================"
echo "              END OF REPORT"
echo "================================================"

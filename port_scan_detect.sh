#!/bin/bash
# Port Scan Detector - Detects potential port scanning activity
#Author: Cortrae Wiggins

echo "=== Port Scan Detection Report ==="
echo "Generated: $(date)"
echo ""

echo "--- Checking for Port Scan Indicators ---"
grep "POSSIBLE BREAK-IN ATTEMPT" /var/log/auth.log | wc -l

echo ""
echo "--- Connection Refused Events ---"
grep "refused connect" /var/log/syslog | wc -l

echo ""
echo "--- Recent Suspicious Connection Attemps ---"
grep "refused connect" /var/log/syslog | tail -10

echo ""
echo "--- Unique Source Addresses ---"
grep "refused connect" /var/log/syslog | grep -o "from [0-9.]*" | sort | uniq -c | sort -rn

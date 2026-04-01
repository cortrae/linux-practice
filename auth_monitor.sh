#!/bin/bash
# Auth Monitor - Detects failed authentication attempts
# Author: Cortrae Wiggins

echo "=== Failed Authentication Report ==="
echo "Generated: $(date)"
echo ""

echo "--- Total Failed Attempts ---"
grep "authentication failure" /var/log/auth.log | wc -l

echo ""
echo "--- Last 10 Failed Attempts ---"
grep "authentication failure" /var/log/auth.log | tail -10

echo ""
echo "--- Targeted Users ---"
grep "authentication failure" /var/log/auth.log | grep -o "user=[a-z]*" | sort | uniq -c | sort -rn

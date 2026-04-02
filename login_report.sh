#!/bin/bash
# Login Report - Summary of successful and failed logins
# Author: Cortrae Wiggins

echo "=== Login Activity Report ==="
echo "Generated: $(date)"
echo ""

echo "--- Successful Logins ---"
grep "session opened" /var/log/auth.log | wc -l

echo ""
echo "--- Failed Logins ---"
grep "authentication failure" /var/log/auth.log | wc -l

echo ""
echo "--- Recent Successful Logins ---"
grep "session opened for user" /var/log/auth.log | tail -10

echo ""
echo "--- Login Ratio ---"
SUCCESS=$(grep "session opened" /var/log/auth.log | wc -l)
FAILED=$(grep "authentication failure" /var/log/auth.log | wc -l)
echo "Successful: $SUCCESS"
echo "Failed: $FAILED"

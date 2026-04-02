#!/bin/bash
# Sudo Monitor - Detects sudo usage and privilege escalation
# Author: Cortrae Wiggins

echo "=== Sudo Usage Report ==="
echo "Generated: $(date)"
echo ""

echo "--- Total Sudo Commands Run ---"
grep "sudo" /var/log/auth.log | grep "COMMAND" | wc -l

echo ""
echo "--- All Sudo Commands ---"
grep "sudo" /var/log/auth.log | grep "COMMAND" | tail -20

echo ""
echo "--- Sudo By User ---"
grep "sudo" /var/log/auth.log | grep "COMMAND" | grep -o "User=[a-zA-Z]*" | sort | uniq -c | sort -rn

echo ""
echo "--- Failed Sudo Attempts ---"
grep "sudo" /var/log/auth.log | grep "incorrect password" | wc -l

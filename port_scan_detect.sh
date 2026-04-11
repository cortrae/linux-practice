#!/bin/bash
# Port Scan Detector - Detects potential port scanning activity
# Author: Cortrae Wiggins

echo "========================================="
echo " Port Scan Detection Report"
echo " Host: $(hostname)"
echo " Date: $(date)"
echo "========================================="
echo ""

echo "[*] Checking for POSSIBLE BREAK-IN ATTEMPT flags..."
BREAKIN=$(grep "POSSIBLE BREAK-IN ATTEMPT" /var/log/auth.log | wc -l)
echo "    $BREAKIN break-in attempt indicators found"
echo ""

echo "[*] Connection refused events in syslog:"
REFUSED=$(grep "refused connect" /var/log/syslog | wc -l)
echo "    $REFUSED connection refused events detected"
echo ""

echo "[*] Recent suspicious connection attempts:"
grep "refused connect" /var/log/syslog | tail -10
echo ""

echo "[*] Unique source addresses:"
grep "refused connect" /var/log/syslog | grep -o "from [0-9.]*" | sort | uniq -c | sort -rn
echo ""

echo "========================================="
echo " SUMMARY"
echo "========================================="
if [ "$BREAKIN" -gt 0 ] || [ "$REFUSED" -gt 10 ]; then
    echo " [!] WARNING: Possible port scan detected"
    echo "     Break-in flags: $BREAKIN"
    echo "     Refused connections: $REFUSED"
else
    echo " [+] No port scan indicators detected"
    echo "     Clean baseline established"
fi
echo ""

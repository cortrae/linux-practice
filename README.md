# SOC Home Lab

## Overview
A personal SOC home lab built on Ubuntu 24.04 LTS running in VirtualBox.
Designed to simulate real security operations workflows using Splunk as the SIEM.

## Environment
- Host OS: Windows
- VM: Ubuntu 24.04 LTS (VirtualBox)
- SIEM: Splunk Enterprise 10.2.1
- Log Sources: /var/log/syslog, /var/log/auth.log

## Lab Exercises

### Exercise 1: Failed Authentication Detection
Simulated brute force login attempts against a local user account.
Generated failed authentication events and detected them in Splunk using auth.log.

**Search used:**
source="/var/log/auth.log" "authentication failure" earliest=-5m

**Findings:**
3 failed authentication events detected for user cortrae.
Events included timestamp, username, terminal (tty), and user ID (uid).

### Exercise 2: Sudo Privilege Escalation Monitoring
Monitored sudo usage across the system to detect potential privilege escalation.

**Script:** sudo_monitor.sh

**Findings:**
23 sudo commands detected on the system.
1 failed sudo attempt identified.
Script extracts exact commands run, user responsible, and timestamps.

**Why it matters:**
Privilege escalation is one of the most common post-exploitation techniques.
Monitoring sudo usage is a core SOC analyst task.

### Exercise 3: Login Activity Report
Generated a full summary of successful vs failed login sessions across the system.

**Script:** login_report.sh

**Findings:**
244 successful sessions detected.
7 failed login attempts recorded.
A high failed-to-successful ration would indicate a brute force attack in progress.

**Why it matters:**
Baseline login activity is the foundation of anomaly detection.
SOC analysts establish normal behavior patterns to identify deviations.
Any sudden spike in failed logins triggers investigation.

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

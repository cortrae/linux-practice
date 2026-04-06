# Splunk SOC Home Lab

## Environment
- OS: Ubuntu 24.04 LTS (VirtualBox VM)
- SIEM: Splunk Enterprise (free tier)
- Host: Windows laptop

## What I Built
Configured a SIEM to ingest Linux authentication logs and detect brute force login attempts in real time.

## Steps Taken
1. Installed and configured Splunk Enterprise on Ubuntu
2. Added /var/log/auth.log as a monitored data input
3. Simulated SSH brute force attacks using failed login attempts
4. Built a scheduled alert triggering on 3+ failed passwords within 5 minutes

## Detection Rule
- Source: /var/log/auth.log
- Search: source="/var/log/auth.log" "Failed password"
- Schedule: Every 5 minutes
- Trigger: Number of results > 3
- Action: Add to Triggered Alerts

## Key Findings
- Ubuntu 24.04 logs failed SSH attempts as "Failed password" in auth.log
- Splunk requires minimum 5GB free disk space to run searches
- Brute force simulation generated 100+ events within minutes

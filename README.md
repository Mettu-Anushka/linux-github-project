# Linux System Monitor Automation


A tiny DevOps‑style project that collects system health data (disk, memory, CPU load, top processes) via Bash and appends to `system_report.log`. Optionally runs daily using GitHub Actions.


## Features
- Disk & memory usage
- CPU load averages
- Top 5 CPU‑intensive processes
- Log appended with timestamp


## Run Locally
```bash
chmod +x system_monitor.sh
./system_monitor.sh
cat system_report.log

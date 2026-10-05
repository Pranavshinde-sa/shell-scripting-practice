# Shell Scripting Practice

28 Bash scripts I wrote while learning Linux automation for DevOps, progressing from basics to small sysadmin tools: monitoring, backups, service management, log analysis, and deployment checks.

This is practice work. The scripts are small and focused, and the goal is solid Linux and Bash fundamentals that I use in my larger DevOps projects.

## Repository structure

```
shell-scripting-practice/
|
|-- basics/              Variables, input, conditions, loops, functions
|   |-- 01 - 11 (.sh)
|   |-- app.log          Sample log data
|   '-- web.log          Sample log data
|
|-- intermediate/        Files, logs, backups, monitoring, services, users
|   |-- 12 - 27 (.sh)
|   |-- app.config       Sample configuration file
|   '-- employees.txt    Sample data for the report script
|
|-- advance/             Larger tool that combines earlier scripts
|   '-- 28_sysadmin_toolkit.sh
|
|-- .github/workflows/
|   '-- shellcheck.yml   Runs ShellCheck on every push
|
'-- README.md
```

## How to run

Requirements: Linux (or WSL) with Bash 4+ and systemd (`systemctl`) for the service scripts.

```bash
git clone https://github.com/Pranavshinde-sa/shell-scripting-practice.git
cd shell-scripting-practice
chmod +x basics/*.sh intermediate/*.sh advance/*.sh

./intermediate/22_deployment_check.sh
./advance/28_sysadmin_toolkit.sh
```

Some scripts read the sample files in their own folder. If a script cannot find its input file, run it from inside that folder.

## Scripts

### Basics

| Script | What it does |
|---|---|
| 01_variables.sh | Variables |
| 02_user_input.sh | User input with `read` |
| 03_arguments.sh | Command line arguments (`$1`, `$2`) |
| 04_conditions.sh | `if`, `elif`, `else` with numeric and string comparisons |
| 05_input_validation.sh | Input validation with regex |
| 06_for_loops.sh | `for` loops |
| 07_while_loops.sh | `while` loops |
| 08_odd_numbers.sh | Odd and even number logic |
| 09_basic_function.sh | Creating a function |
| 10_function_arguments.sh | Passing arguments to functions |
| 11_show_date_function.sh | Function that uses the `date` command |

### Intermediate

| Script | What it does |
|---|---|
| 12_file_checker.sh | Checks whether a file exists |
| 13_directory_creator.sh | Creates a directory using `&&` and `||` |
| 14_log_analyzer.sh | Counts errors and warnings in a log file |
| 15_backup_script.sh | Creates a backup of a file |
| 16_disk_usage_monitor.sh | Checks disk usage against a threshold |
| 17_process_monitor.sh | Checks whether a process is running |
| 18_service_auto_restart.sh | Restarts a service if it has stopped |
| 19_service_manager.sh | Start, stop and status operations for services |
| 20_system_health_check.sh | Basic system health check |
| 21_advanced_health_monitor.sh | CPU, memory and disk monitoring |
| 22_deployment_check.sh | Verifies nginx is running and disk usage is normal, and returns an exit code |
| 23_failed_login_monitor.sh | Detects failed login attempts |
| 24_backup_cleanup.sh | Finds old backups and deletes them after a typed CONFIRM |
| 25_user_manager.sh | Linux user management automation |
| 26_config_reader.sh | Reads and parses a configuration file |
| 27_employee_report.sh | Generates a report from employee data |

### Advanced

| Script | What it does |
|---|---|
| 28_sysadmin_toolkit.sh | Interactive menu that reuses scripts 15, 16, 17 and 24 (process check, disk usage, backup, backup cleanup) |

## Concepts covered

- **Bash fundamentals:** shebang, variables, `read`, arguments, environment variables
- **Control flow:** conditionals, loops, `case` menus, regex input validation
- **Functions and reuse:** arguments, return codes, `source` to reuse functions across scripts
- **Exit status:** `$?`, `&&` and `||`, script exit codes for use in pipelines
- **Text processing:** pipes, `grep`, `cut`, `awk`, `sed`
- **System administration:** process and service monitoring, automatic service recovery, disk and memory checks, failed login detection
- **Operations tasks:** backup automation, safe deletion with confirmation, log analysis, user management, config parsing, report generation

## Quality checks

- Every script starts with a shebang.
- ShellCheck runs on every push (see the badge above) and the scripts pass at warning level.
- Destructive operations, such as backup deletion, validate their inputs and require explicit confirmation.

## Known limitations and next steps

- Most scripts do not use `set -euo pipefail` yet. I plan to add it to the standalone scripts, but not to those meant to be `source`d, because it would change the calling shell.
- Several scripts use `read` without `-r` and some variables are not quoted in the basics folder. These show up as ShellCheck style notes and I plan to clean them up.
- Thresholds such as disk usage (80%) and the service name (nginx) are hardcoded. Making them arguments is a next step.
- The scripts are Linux specific and use `systemctl`.

## Author

Pranav Shinde
GitHub: https://github.com/Pranavshinde-sa
LinkedIn: https://www.linkedin.com/in/pranavshinde3

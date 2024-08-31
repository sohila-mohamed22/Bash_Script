# Script Timer 🕒

A bash script for timing the execution of commands and optionally logging the execution time to a file. This script provides options to display usage instructions, run commands with timing, and log execution details.

## Table of Contents 📑

1. [Features](#Features)
2. [Usage](#Usage)
   - [Command-Line Options](#Command-Line-Options)
   - [Examples](#Examples)
3. [Script Overview](#Script-Overview)
   - [Functions](#Functions)
   - [Main Menu](#Main-Menu)
4. [Installation](#Installation)

## Features 🌟

- **Times the execution** of a command.
- **Logs execution time** to a file if requested.
- **Interactive menu** to choose script functionality.
- **Customizable log file** name.

## Usage 💻

### Command-Line Options 🎛️

```bash
Usage: ./script_timer.sh [-l] [-f log_file] command
  -l        Log execution time to a file
  -f FILE   Specify a log file (default: execution_log.txt)
  command   The command to execute and time
```
## Examples 🚀

**Run a Command Without Logging**

To time the execution of a command without logging, use:

```bash
./script_timer.sh "sleep 2"
```
**Run a Command and Log Execution Time**

To time the execution of a command and log the time to a specified file, use:

```bash
./script_timer.sh -l -f my_log_file.txt "sleep 2"
```
## Script Overview 📝

### Functions 🔍

   - **`usage()`**: Displays usage instructions and exits the script.
   - **`script_timer()`**: Times the execution of a command and logs the time based on provided options.
   - **`main()`**: Provides an interactive menu for the user to select script functionality.

### Main Menu 📋

  - **Press `0`**: Show what the script does.
  - **Press `1`**: Run the script timer.
  - **Press Enter**: Exit the script.

## Installation 🛠️

Follow these steps to set up and use the Disk Usage Checker script:

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/yourusername/Disk_Checker.git
    ```

2. **Navigate to the Directory:**

    ```bash
    cd Disk_checker
    ```

3. **Make the Script Executable:**

    ```bash
    chmod +x Disk_Checker.sh
    ```

4. **Run the Script:**


    ```bash
    ./Disk_Checker.sh [options] /path/to/directory
    ```

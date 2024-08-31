# Disk Usage Checker 📊

A bash script for checking disk usage of files and directories. It provides options to display either the sizes of individual files and subdirectories or the total size of the specified directory.

## Table of Contents 📑

1. [Features](#Features)
2. [Usage](#usage)
   - [Command-Line Options](#Command-Line-Options)
   - [Examples](#Examples)
3. [Script Overview](#Script-Overview)
   - [Functions](#Functions)
   - [Main Menu](#Main-Menu)
4. [Installation](#Installation)

## Features 🌟

- **Displays sizes** of individual files and subdirectories.
- **Calculates and displays** the total size of a directory.
- **Interactive menu** for selecting script functionality.
- **Human-readable sizes** (KB, MB, GB).

## Usage 💻

### Command-Line Options 🎛️

- **Usage**: ./Disk_Checker.sh [-l] Directory
   - **-l**        Display the disk usage of individual files and subdirectories within the directory
   - **Directory** The directory to check its disk usage

### Examples 🚀

 Display Total Size of Directory

- **To check the total size of a directory, use the following command**: ./disk_usage_checker.sh /path/to/directory

- **To check the sizes of individual files and subdirectories within a directory, use the following command**:./disk_usage_checker.sh -l /path/to/directory

## Script Overview 📝

### Functions 🔍

- **`usage()`**: Displays usage instructions and exits the script.
- **`disk_checker()`**: Analyzes and displays disk usage based on provided options and directory.
- **`main()`**: Provides an interactive menu for the user to select script functionality.

### Main Menu 📋

- **Press `0`**: Show what the script does.
- **Press `1`**: Run the disk checker.
- **Press Enter**: Exit the script.

# Installation 🛠️

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


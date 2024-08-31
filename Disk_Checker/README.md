# 🧰 Disk Usage Checker

This Bash script is a versatile tool designed to check and display the disk usage of a specified directory. It can show either the total size of the directory or the individual sizes of all files and subdirectories within it. 🗂️

## 📋 Table of Contents

- [Features](#Features)
- [Usage](#Usage)
- [Example](#Example)
- [How It Works](#How-It-Works)
- [Example Output](#Example-Output)
- [Notes](#Notes)
- [Contact](#Contact)

## ✨ Features

- **Total Disk Usage**: Displays the total disk usage of a specified directory.
- **Individual File Sizes**: Optionally display the disk usage of individual files and subdirectories within the directory.
- **Interactive Menu**: Simple menu-based interface for running the script.

## 🚀 Usage

To use the script, run it from the terminal with the following command:

```bash
./Disk_Checker.sh [options] <directory>
```
### Options

- `-l`: Display the disk usage of individual files and subdirectories within the specified directory.

### Arguments

- `<directory>`: The path to the directory you want to check.

### Menu Options

When you run the script, you’ll be presented with the following options:

- **Press 0**: Display the usage instructions.
- **Press 1**: Run the disk usage checker.
- **Press Enter**: Exit the script.

## 📜 How It Works

1. **Command-Line Parsing**: The script uses `getopts` to parse the `-l` option for displaying individual file sizes.

2. **Directory Validation**: Checks if the provided directory exists and is valid.

3. **Disk Usage Calculation**:
   - If the `-l` option is specified, it lists the sizes of individual files and subdirectories.
   - If no option is specified, it displays the total size of the directory.

4. **Interactive Menu**: The script provides an interactive menu that allows users to display the usage instructions, run the disk checker, or exit.

## 🖼️ Example Output

### When Checking a Directory with the `-l` Option

```bash
Calculating the size of files and subdirectories within: my_directory
subdir1: Directory: 12M
subdir2: Directory: 8M
file1.txt: File: 4K
file2.log: File: 16K
```
### When Checking a Directory without the -l Option

```bash
Calculating the size of directory: my_directory
my_directory: 20M
```

## ⚠️ Notes

- Ensure you have the necessary permissions to access and calculate disk usage for the specified directory.
- The script is designed to handle basic directory and file structures. Complex setups may require additional customization.


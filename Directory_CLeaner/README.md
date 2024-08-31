# 🗑️ Directory Cleaner Script

This Bash script helps you clean up files in a directory that are older than a specified number of days. You can choose to delete all old files, select specific files to delete, or exit without deleting any files. 🧹

## 📋 Table of Contents

- [Features](#Features)
- [Usage](#Usage)
- [Example](#Example)
- [How It Works](#How-It-Works)
- [Example Output](#Example-Output)
- [Notes](#Notes)

## 📋 Features

- **List Old Files**: Shows files in a directory that are older than the specified number of days.
- **Delete Files**: Option to delete all old files or select specific files to delete.
- **Interactive Menu**: Prompts you for action and user input.

## 🚀 Usage

1. **Run the Script**: Execute the script with two arguments - the directory path and the number of days.

    ```bash
    ./Directory_Cleaner.sh <directory_path> <days>
    ```

    - `<directory_path>`: The path to the directory you want to clean up.
    - `<days>`: The number of days to use as the threshold for old files.

2. **Follow the Prompts**: The script will:
    - List files older than the specified number of days.
    - Provide options to:
        - Exit without deleting any files.
        - Delete all listed files.
        - Select specific files to delete.

## 🛠️ Example

```bash
./directory_cleaner.sh /path/to/directory 30
```

## 📜 How It Works

1. **Check Arguments**: Validates that exactly two arguments are provided.
2. **Directory Check**: Ensures the specified directory exists.
3. **Find Old Files**: Uses `find` to list files older than the specified number of days.
4. **User Interaction**: Prompts for action and manages file deletion based on user choice.
5. **File Deletion**: Deletes files based on user input or specified options.

## 🖼️ Example Output

Files older than or equal to 30 days in directory_name:

- old_file1.txt - Modified 45 days ago
- old_file2.log - Modified 60 days ago

Press 0 to exit without deleting.  
Press 1 to delete all files.  
Press 2 to select specific files for deletion.

Enter your choice: 2

Enter the number of the file to delete (or press Enter to exit):  
Valid numbers are 1 to 2

## ⚠️ Notes

- Ensure you have the necessary permissions to delete files in the specified directory.
- Use with caution to avoid accidental data loss.

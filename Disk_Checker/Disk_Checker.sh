#!/bin/bash

# Default values
SHOW_INDIVIDUAL_FILES=false  # Flag to control whether to display disk usage of individual files and subdirectories

# Function to display usage instructions
usage() {
    echo "Usage: $0 [-l] Directory"
    echo "  -l        Display the disk usage of individual files and subdirectories within the directory"
    echo "  Directory The directory to check its disk usage"
    echo
    exit 1  # Exit the script if usage is displayed
}

# Function to check disk usage
disk_checker() {
    # Parse command-line options using getopts
    while getopts "l" opt; do
        case ${opt} in
            l)
                SHOW_INDIVIDUAL_FILES=true  # Set flag to display individual file sizes
                ;;
            *)
                usage  # Display usage instructions for any invalid options
                ;;
        esac
    done
    
    # Shift processed options out, leaving only the directory argument
    shift $((OPTIND - 1))

    local DIRECTORY="$*"  # Capture the remaining argument as the directory to check

    # Check if a directory argument is provided
    if [ -z "$DIRECTORY" ]; then
        echo "Error: No directory provided."
        usage  # Display usage instructions if no directory is specified
    fi

    # Check if the provided argument is a valid directory
    if [ ! -d "$DIRECTORY" ]; then
        echo "Error: Directory '$DIRECTORY' does not exist."
        usage  # Display usage instructions if the directory does not exist
    fi

    if [ "$SHOW_INDIVIDUAL_FILES" = true ]; then
        # List all files and subdirectories in the directory without descending further
        readarray -t ITEMS < <(find "$DIRECTORY" -maxdepth 1 -mindepth 1)

        # Check if any items were found
        if [ ${#ITEMS[@]} -eq 0 ]; then
            echo "No files or subdirectories found in the directory."
        else
            echo "Calculating the size of files and subdirectories within: $(basename "$DIRECTORY")"
            for ITEM in "${ITEMS[@]}"; do
                if [ -d "$ITEM" ]; then
                    # Print the size of directories
                    du -sh "$ITEM" | awk -v itemname="$(basename "$ITEM")" '{print itemname ": Directory: " $1}'
                else
                    # Print the size of files
                    du -sh "$ITEM" | awk -v itemname="$(basename "$ITEM")" '{print itemname ": File: " $1}'
                fi
            done
        fi
    else
        # Calculate and display the total size of the directory
        echo "Calculating the size of directory: $(basename "$DIRECTORY")"
        du -sh "$DIRECTORY" | awk -v dirname="$(basename "$DIRECTORY")" '{print dirname ": " $1}'
    fi
}

# Main function to run the menu system
main() {
    while true; do
        echo "Press 0 to show what this script does"
        echo "Press 1 to run the disk checker"
        echo "Press Enter to exit"
        
        read -r NUM  # Read user input

        if [[ -z "$NUM" ]]; then
            # Exit if no input is provided (Enter key pressed)
            break 
        elif (( NUM == 0 )); then
            # Display usage instructions
            usage
        elif (( NUM == 1 )); then
            # Run the disk checker function with all arguments
            disk_checker "$@"
            break 
        else
            # Handle invalid input
            echo "Invalid option. Please enter 0 or 1."
        fi
    done
}

# Call the main function with all script arguments
main "$@"

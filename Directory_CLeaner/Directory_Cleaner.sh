#!/bin/bash

# Function to clean up files older than a specified number of days in a directory
Directory_Cleaner() {
    # Check if exactly two arguments are provided
    if (( "$#" != 2 )); then
        echo "Usage: $0 <directory_path> <days>"
        exit 1
    fi

    # Assigning arguments to local variables
    local DIRECTORY=$1
    local -i DAYS=$2

    # Check if the specified directory exists
    if [ -d "$DIRECTORY" ]; then
        # Find files older than or equal to the specified number of days
        local FILES
        readarray -t FILES < <(find "$DIRECTORY" -type f -mtime +$((DAYS - 1)))

        # Check if any files were found
        if [ ${#FILES[@]} -eq 0 ]; then
            echo "No files older than $DAYS days in the directory."
        else
            echo "Files older than or equal to $DAYS days in $(basename "$DIRECTORY"):"

            # Initialize an array to hold files for deletion
            local DEL_FILES=()
            local -i i=0

            # Iterate over the files to display and prepare for deletion
            for FILE in "${FILES[@]}"; do
                # Calculate the number of days since the file was last modified
                local FILE_MODIFICATION_DATE
                FILE_MODIFICATION_DATE=$(stat -c %Y "$FILE")
                local CURRENT_DATE
                CURRENT_DATE=$(date +%s)
                local -i DAYS_AGO
                DAYS_AGO=$(( (CURRENT_DATE - FILE_MODIFICATION_DATE) / 86400 ))

                echo "$((i + 1)). $(basename "$FILE") - Modified $DAYS_AGO days ago"

                # Store the file in the DEL_FILES array
                DEL_FILES[$i]="$FILE"
                i=$((i + 1))
            done

            # Prompt user for action
            echo "Press 0 to exit without deleting."
            echo "Press 1 to delete all files."
            echo "Press 2 to select specific files for deletion."

            read -r USER_CHOICE

            # Handle user choice
            case $USER_CHOICE in
                0)
                    echo "Exiting without deleting any files."
                    ;;
                1)
                    # Delete all files
                    for FILE in "${DEL_FILES[@]}"; do
                        rm "$FILE"
                    done
                    echo "All files deleted successfully."
                    ;;
                2)
                  # Loop for user input to delete specific files
            while true; do
                echo "Enter the number of the file to delete (or press Enter to exit):"
                echo "Valid numbers are 1 to ${#DEL_FILES[@]}"
                read -r FILE_NUM

                # Exit if no input is provided
                if [[ -z "$FILE_NUM" ]]; then
                    echo "Exiting without deleting any files."
                    break
                fi

                # Validate user input
                if [[ "$FILE_NUM" =~ ^[0-9]+$ ]] && (( FILE_NUM >= 1 && FILE_NUM <= ${#DEL_FILES[@]} )); then
                    # Adjust FILE_NUM to zero-based index
                    local -i FILE_INDEX=$((FILE_NUM - 1))

                    # Delete the selected file
                    rm "${DEL_FILES[FILE_INDEX]}"
                    echo "File $(basename "${DEL_FILES[FILE_INDEX]}") deleted."
                     
                    # Remove the deleted file from the array
                    DEL_FILES=("${DEL_FILES[@]:0:FILE_INDEX}" "${DEL_FILES[@]:FILE_INDEX+1}")
                    
                    if [ ${#DEL_FILES[@]} -eq 0 ]; then
                      # If no files are left in the DEL_FILES array, notify the user
                      echo "Directory became empty."
                      # Exit the while loop as there are no more files to delete
                      break
                    fi
                
                    # Display remaining files
                    echo "Remaining files:"
                    local -i i=1
                    for FILE in "${DEL_FILES[@]}"; do
                        FILE_MODIFICATION_DATE=$(stat -c %Y "$FILE")
                        CURRENT_DATE=$(date +%s)
                        DAYS_AGO=$(( (CURRENT_DATE - FILE_MODIFICATION_DATE) / 86400 ))
                        echo "$i. $(basename "$FILE") - Modified $DAYS_AGO days ago"
                        i=$((i + 1))
                    done
                else
                    echo "Invalid number. Please enter a valid file number."
                fi
          
            done
            ;;
                *)
                    echo "Invalid input. Exiting."
                    ;;
            esac
        fi
    else
        echo "Directory \"$DIRECTORY\" does not exist."
        exit 1
    fi
}

# Main function to initiate the script
main() {
    Directory_Cleaner "$1" "$2"
}

# Calling the main function with the provided arguments
main "$1" "$2"

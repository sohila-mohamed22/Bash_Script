#!/bin/bash

# Function to organize files in the specified directory based on file extensions
file_organizer() {
    # Declare and assign the first argument (directory path) to the DIRECTORY variable
    declare DIRECTORY=$1

    # Check if the specified directory exists
    if [ -d "$DIRECTORY" ]; then
        # Declare variables for file handling
        declare FILE
        declare SUB_DIRECTORY

        # Find all files in the directory (not deeper than one level) and store them in the FILE array
        readarray -t FILE < <(find "$DIRECTORY" -maxdepth 1 -type f )

        # Loop through each file in the FILE array
        for FILE in "${FILE[@]}"; do
            # Extract the file extension and store it in the EXT variable
            declare EXT=${FILE##*.}

            # Organize files based on their extensions
            if [[ "$EXT" == "txt" ]]; then
                # Find or create the 'txt' subdirectory
                SUB_DIRECTORY=$(find "$DIRECTORY" -maxdepth 1 -type d -name "txt" ! -path "$DIRECTORY")
                if [[ -z "${SUB_DIRECTORY}" ]]; then
                    SUB_DIRECTORY=$DIRECTORY/txt
                    mkdir "$SUB_DIRECTORY"  # Create the 'txt' subdirectory if it doesn't exist
                fi
                mv "$FILE" "$SUB_DIRECTORY"  # Move the file to the 'txt' subdirectory

            elif [[ "$EXT" == "jpg" ]]; then
                # Find or create the 'jpg' subdirectory
                SUB_DIRECTORY=$(find "$DIRECTORY" -maxdepth 1 -type d -name "jpg" ! -path "$DIRECTORY")
                if [[ -z "${SUB_DIRECTORY}" ]]; then
                    SUB_DIRECTORY=$DIRECTORY/jpg
                    mkdir "$SUB_DIRECTORY"  # Create the 'jpg' subdirectory if it doesn't exist
                fi
                mv "$FILE" "$SUB_DIRECTORY"  # Move the file to the 'jpg' subdirectory

            elif [[ "$EXT" == "pdf" ]]; then
                # Find or create the 'pdf' subdirectory
                SUB_DIRECTORY=$(find "$DIRECTORY" -maxdepth 1 -type d -name "pdf" ! -path "$DIRECTORY")
                if [[ -z "${SUB_DIRECTORY}" ]]; then
                    SUB_DIRECTORY=$DIRECTORY/pdf
                    mkdir "$SUB_DIRECTORY"  # Create the 'pdf' subdirectory if it doesn't exist
                fi
                mv "$FILE" "$SUB_DIRECTORY"  # Move the file to the 'pdf' subdirectory

            else
                # Handle files with unspecified extensions by placing them in a 'misc' subdirectory
                SUB_DIRECTORY=$(find "$DIRECTORY" -maxdepth 1 -type d -name "misc" ! -path "$DIRECTORY")
                if [[ -z "${SUB_DIRECTORY}" ]]; then
                    SUB_DIRECTORY=$DIRECTORY/misc
                    mkdir "$SUB_DIRECTORY"  # Create the 'misc' subdirectory if it doesn't exist
                fi
                mv "$FILE" "$SUB_DIRECTORY"  # Move the file to the 'misc' subdirectory
            fi
        done
    else 
        # Output an error message if the specified directory does not exist
        echo "directory \"$DIRECTORY\" not exists"
    fi  
}

# Main function to start the file organization process
main() {
    file_organizer "$1"  # Call the file_organizer function with the provided directory path
}

# Entry point of the script
main "$1"  # Pass the first command-line argument to the main function



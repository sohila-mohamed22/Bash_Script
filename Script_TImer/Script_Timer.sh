#!/bin/bash  

# Default values
LOG_EXECUTION_TIME=false       # Flag indicating whether to log execution time
LOG_FILE="execution_log.txt"   # Default log file name

# Function to display usage instructions to the user
usage() {
    echo "Usage: $0 [-l] [-f log_file] command"
    echo "  -l        Log execution time to a file"
    echo "  -f FILE   Specify a log file (default: execution_log.txt)"
    echo "  command   The command to execute and time"
    exit 1
}

# Function to time the execution of a command
script_timer() {
    # Check if a command has been provided
    if [ $# -eq 0 ]; then
        echo "Error: No command provided."
        usage  # Display usage instructions if no command is provided
    else
        # Parse options using getopts
        while getopts "lf:" opt; do
            case ${opt} in
                l )
                    LOG_EXECUTION_TIME=true  # Set flag to enable logging if -l option is provided
                    ;;
                f )
                    LOG_FILE=$OPTARG  # Assign the user-specified log file name to LOG_FILE
                    ;;
                * )
                    break  # Exit option parsing loop for any unexpected options
                    ;;
            esac
        done
        
        # Shift processed options, so $@ contains only the command and its arguments
        shift $((OPTIND - 1))

        local COMMAND="$*"  # Capture all remaining arguments as the command to be executed

        # Check if the command is valid and executable
        if $COMMAND >/dev/null 2>&1 || [ -x "$COMMAND" ]; then
            # Record the start time
            START_TIME=$(date +%s%3N)
            
            # Execute the command
            eval "$COMMAND"
            
            # Capture the end time
            END_TIME=$(date +%s%3N)
            EXECUTION_TIME=$((END_TIME - START_TIME))  # Calculate the execution time
            
            if [ "$LOG_EXECUTION_TIME" = false ]; then
            # Display the execution time
            echo "Command $COMMAND executed in $EXECUTION_TIME milliseconds."
            
            # If logging is enabled, log the execution time to lsthe specified file
            else
                TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")  # Generate a timestamp
                echo "$TIMESTAMP - Command: '$COMMAND' executed in $EXECUTION_TIME milliseconds" >> "$LOG_FILE"
                echo "Execution time logged to $LOG_FILE"
            fi
        else
            echo "Error: It is neither a valid command nor script."  # Error message if the command is invalid
        fi
    fi
}

# Main function to start the script timer process
main() {
     while true; do
        echo "Press 0 to show what this script does"
        echo "Press 1 to run the script timer"
        echo "Press Enter to exit"
        
        read -r NUM  # Read user input

        if [[ -z "$NUM" ]]; then
            # Exit if no input is provided (Enter key pressed)
            break 
        elif (( NUM == 0 )); then
            # Display usage instructions
            usage
        elif (( NUM == 1 )); then
            # Run the script timer with all arguments
            script_timer "$@"
            break 
        else
            # Handle invalid input
            echo "Invalid option. Please enter 0 or 1."
        fi
    done
}

# Start the main function
main "$@"

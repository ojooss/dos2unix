#!/usr/bin/env bash

set -e

# Function to process a directory
process_directory() {
    for file in "$1"/*; do
        if [[ -f $file ]]; then
            dos2unix $@ "$file"
        fi
    done
}

# Main script logic
case $1 in
    --file)
        if [[ -f $2 ]]; then
            dos2unix ${@:3} "$2"
        else
            echo "Error: $2 is not a valid file."
            exit 1
        fi
        ;;
    --dir)
        if [[ -d $2 ]]; then
            find "$2" -exec  dos2unix ${@:3} {} \;
        else
            echo "Error: $2 is not a valid directory."
            exit 1
        fi
        ;;
    *)
        echo ""
        echo "Usage: $0 [--file <file_path> | --dir <dir_path>] [additional dos2unix options]"
        dos2unix --help | grep -v "Usage:"
        exit 1
        ;;
esac

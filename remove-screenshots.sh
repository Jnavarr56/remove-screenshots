#!/bin/bash

TRASH_COMMAND_INSTALLED=true
trash &> /dev/null

TRASH_COMMAND_OUTPUT=$?
if [ $TRASH_COMMAND_OUTPUT -eq 127 ]; then
    TRASH_COMMAND_INSTALLED=false
fi
    
if [ $TRASH_COMMAND_INSTALLED = false ]; then
    echo "TRASH COMMAND NOT INSTALLED, MUST INSTALL!"
    exit 1
fi

SCREENSHOT_FILES_PREFIX="Screen Shot" 
SCREENSHOT_FILES_EXTENSION="png" 
SCREENSHOT_FILES_DIRECTORY_PATH="/Users/jorgenavarro/Desktop/"

SCREENSHOT_FILES="$SCREENSHOT_FILES_DIRECTORY_PATH*" 
SCREENSHOT_FILE_REGEX="^($SCREENSHOT_FILES_PREFIX).*\.$SCREENSHOT_FILES_EXTENSION$"

for FILENAME_WITH_PATH in $SCREENSHOT_FILES
do  
    FILENAME=${FILENAME_WITH_PATH/$SCREENSHOT_FILES_DIRECTORY_PATH/""}

	if [[ $FILENAME =~ $SCREENSHOT_FILE_REGEX ]]; 
    then
        echo "DELETING: $FILENAME_WITH_PATH"
        chmod 777 "$FILENAME_WITH_PATH"
        trash "$FILENAME_WITH_PATH" 
    fi
done
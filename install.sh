#!/bin/bash

INSTALL_DIRECTORY_NAME="Dotfiles" # The name of the directory to install from.

# Stop if this is being run from any directory besides the install directory
DIRECTORY=${PWD}
DIRECTORY_NAME=${PWD##*/}
if [ ! $DIRECTORY_NAME == $INSTALL_DIRECTORY_NAME ]; then
  echo "ERROR: This directory \"$DIRECTORY_NAME\" doesn't match $INSTALL_DIRECTORY_NAME."
  echo "This script only runs from the $INSTALL_DIRECTORY_NAME directory."
  exit 1
fi

function MakeSymlink {
  DESTINATION=~/.$thisFILE
  if [ -f $DESTINATION ] || [ -d $DESTINATION ]; then
    if [ ! -L $DESTINATION ]; then
      echo "ERROR: $DESTINATION is a file and it's not a symlink!"
    fi
  else
    ln -s $DIRECTORY/$thisFILE $DESTINATION
  fi
}

for thisFILE in *; do 
  if [[ ! $thisFILE =~ ".sh" ]]; then
    # Exclude shell scripts
    if [[ ! $thisFILE =~ "scripts" ]]; then
      echo $thisFILE
      # Exclude the scripts directory
      # MakeSymlink $thisFILE
    fi
  fi
done

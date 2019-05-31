#!/bin/bash

# DESKTOP CLEANER v 1.0
# ---
# Created by Henrik Larsson 2017: latohela@gmail.com
# ---
# INFORMATION
# Run script to clean desktop. All files and directories on the user desktop
# will be moved in to a directory specified by the user [see settings section
# below]. By default, the target path is $HOME/.old-desktop-files. This is 
# easily changed by the user. If filename already exists in target, it will
# be renamed so that it is not overwritten. Tested in Debian.
# 
# DEPENDENCIES: 
# * xdg-user-dirs (https://www.freedesktop.org/wiki/Software/xdg-user-dirs)
# * bash shell
# 
# INSTALLATION:
# 1) put script in desired location
# 2) make it executable: sudo chmod +x /path/to/script.sh
# 3) run it by typing in terminal: ./script.sh or bash script.sh
# 
# TIPS:
# 1) put this file in /usr/local/bin and name it "clean". This way, you only 
#    have to call it by typing "clean" in terminal
# 2) bind a button (combination) to execute script. This way, cleaning the 
#    desktop is done really fast and easy.


# name of directory to store files in
DIR=".old-desktop-files"        

# path to location to store files in
TARGET="$HOME/$DIR"             

# path to users directory
SOURCE=$(xdg-user-dir DESKTOP)  

FILES_IN_DESKTOP=$(find $SOURCE -type f | wc -l)

if [ "$FILES_IN_DESKTOP" -lt 2 ]; then
  echo "No files to move from desktop. Aborting."
  exit 0
fi

# if target doesn't exist - create it
if [[ ! -d $TARGET ]]; then
  mkdir $TARGET
fi

# move the actual files
mv --backup=t $SOURCE/* $TARGET

echo "$(($FILES_IN_DESKTOP-1)) file(s) from desktop has been moved to $TARGET."
echo "Size of $DIR: $(find $TARGET -type f | wc -l) file(s) ($(du -sh $TARGET | awk '{print $1}'))"

exit 0

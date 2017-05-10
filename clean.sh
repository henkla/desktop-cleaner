#!/bin/bash


# Created by Henrik Larsson 2017: lthlarsson@gmail.com
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


# SETTINGS
ENDDIR=".old-desktop-files"			# name of directory to store files in
TARGET="$HOME/$ENDDIR"					# path to location to store files in
SOURCE=$(xdg-user-dir DESKTOP)	# path to users directory

# IF TARGET DOESN'T EXIST - CREATE IT
if [[ ! -d $TARGET ]]; then

	mkdir $TARGET

fi

# MOVE ALL ON DESKTOP TO THE TARGET LOCATION
mv --backup=t $SOURCE/* $TARGET

exit 0

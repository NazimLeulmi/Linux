#!/bin/bash - 
#===============================================================================
#
#          FILE: tohome.sh
# 
#         USAGE: ./tohome.sh file1 file2
#      SYNOPSIS: tohome {FILE...}
# 
#   DESCRIPTION: copy all files that are supplied as arguments to home . if
#                no args are supplied , the script will prompt the user to
#                enter filenames seperated by a space
#        AUTHOR: Ryan Leulmi, 
#       CREATED: 17/07/18 16:28
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# if no args are supplied prompt the user and read the file names
if [ $# -le 0 ];
then
   echo "There are no files supplied to the script: ${#}"
   echo "Enter the path of the files that you want to copy to your home directory"
   read files
   for file in $files
   do
      echo $file
   done
else 
#
   echo "There are ${#} files supplied to the script"
   for file in $@
   do
      echo "copying ${file} to /home/${USER}"
      cp $file ~/
   done
fi

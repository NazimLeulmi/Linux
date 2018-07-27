#!/bin/bash - 
#===============================================================================
#
#          FILE: transperm.sh
# 
#         USAGE: ./transperm.sh 4750
#         
#   DESCRIPTION: transform permissions from absolute to relative mode

#        AUTHOR: RYAN LEULMI
#===============================================================================

set -o nounset                              # Treat unset variables as an error


if [ $# -le 0 ];
then
   echo "no arguments have been supplied to the script"
elif [ $# -gt 1 ];
then
   echo "too many arguments have been supplied"
else
   # the argument has been passed
   echo "your permissions are made of ${#1} digits"
   # if the permissions have 4 digits , the first digit refers to the special permissions
   if [ ${#1} = 4 ];
   then
      echo "special permissions have been applied"
   elif [ ${#1} = 3 ];
   then
      echo "basic permissions have been applied"
      uPerms=${1:0:1}
      gPerms=${1:1:1}
      oPeroms=${1:2:1}
   else
      echo "the number of digits supplied has to be 3 or 4"
   fi
   # loop through all the characters in the permissions and print them
fi

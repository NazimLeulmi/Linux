#!/bin/bash - 
#===============================================================================
#
#          FILE: quickpasswords.sh
# 
#         USAGE: ./quickpasswords.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2018-07-22 13:13
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

users=("linda" "laura" "anna" "anouk")
pass="password"

for user in ${users[@]}
do
   echo "${user}:${pass}" | chpasswd
done

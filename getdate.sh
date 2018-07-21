#!/bin/bash - 
#===============================================================================
#
#          FILE: getdate.sh
# 
#         USAGE: ./getdate.sh 
# 
#   DESCRIPTION: this script will display the current date in 3 lines using
#                command substitution & the substitution operator to format it
                 
# 
#        AUTHOR: Ryan
#       CREATED: 17/07/18 18:49
#===============================================================================

set -o nounset                              # Treat unset variables as an error

date=$(date +%D)

cat<<PROMPT
The day is ${date:3:2}
The month is ${date:0:2}
The year is ${date:6:2}
PROMPT

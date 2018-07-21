#!/bin/bash - 
#===============================================================================
#
#          FILE: lab6.sh
# 
#         USAGE: ./lab6.sh 
# 
#   DESCRIPTION: Manage Users and groups
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 18/07/18 11:16
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#groups
sales=('linda' 'laura')
account=('anna' 'anouk')


for user in ${sales[@]}
do
   useradd -m -g sales -G users ${user:-user doesnt exist}
done

for user in ${account[@]}
do
   useradd -m -g account -G users ${user:-user doesnt exist}
done

exit 0

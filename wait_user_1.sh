#!/bin/bash - 
#===============================================================================
#
#          FILE: wait_user_1.sh
# 
#         USAGE: ./wait_user_1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月24日 22时09分40秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
printf "Enter username:"
read user
while true
do
	if who | grep "$user" > /dev/null
	then
		break
	fi

	sleep 30
done


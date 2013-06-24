#!/bin/bash - 
#===============================================================================
#
#          FILE: util_user.sh
# 
#         USAGE: ./util_user.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月24日 22时05分40秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

printf "Enter username:"
read user
until who | grep "$user" > /dev/null
do
	sleep 30
done


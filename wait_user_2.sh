#!/bin/bash - 
#===============================================================================
#
#          FILE: wait_user_2.sh
# 
#         USAGE: ./wait_user_2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月24日 22时30分15秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
wait_user()
{
	until who | grep "$1" > /dev/null
	do
		sleep ${2:-30}
	done
}


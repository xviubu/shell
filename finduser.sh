#!/bin/bash - 
#===============================================================================
#
#          FILE: finduser.sh
# 
#         USAGE: ./finduser.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月23日 13时27分10秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
if test $# -ne 1
then
	echo Usage: finduser username >&2
	exit 1
fi

who | grep $1


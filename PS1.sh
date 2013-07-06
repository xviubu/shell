#!/bin/bash - 
#===============================================================================
#
#          FILE: PS1.sh
# 
#         USAGE: ./PS1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月30日 13时35分32秒 CST CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
cd()
{
	command cd "$@"
	x=$(pwd)
	PS1="${x##*/}\$ "
}


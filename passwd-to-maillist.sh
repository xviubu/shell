#!/bin/bash - 
#===============================================================================
#
#          FILE: passwd-to-maillist.sh
# 
#         USAGE: ./passwd-to-maillist.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月30日 13时28分22秒 CST CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
rm -rf /tmp/*.mailing-list

while IFS=: read user passwd uid gid name home Shell
do
	Shell=${Shell:-/bin/sh} 
	file="/tmp/$(echo $Shell | sed -e 's;^/;;' -e 's;/;-;g').mailing-list"
	echo $user, >> $file
done


#!/bin/bash - 
#===============================================================================
#
#          FILE: taglist.sh
# 
#         USAGE: ./taglist.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月17日 22时49分21秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

process()
{
	cat "$1" |
	sed -e 's#systemitem *role="url"#URL#g' -e 's#/systemitem#/URL#' | 
	tr  ' (){}[]'   '\n\n\n\n\n\n\n' | 
	egrep '>[^<>]</' | awk -F:'[<>]' -v FILE="$1"  '{printf("%-31s\t%-15s\t%s\n",$3,$2,FILE)}' | sort | uniq -c | sort -k2,2 -k3,3 | 
	awk '{print ($2 == Last) ? ($0 "<-----" ) : $0 
		Last = $2}'
}

for f in "$@"
do 
	process "$f"
done

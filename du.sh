#!/bin/bash - 
#===============================================================================
#
#          FILE: du.sh
# 
#         USAGE: ./du.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月27日 21时10分40秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
cd /home
du  -s  * |
	sort -nr | 
		sed 10q | 
			while read amount name
			do
				mail -s  "disk usage warning" $name <<- EOF
				Greetings. You are one of top 10 consumers of disk space on the system.
				Youe home directory uses $amount disk blocks.

				Please  clean up unneeded files,as soon as possible.

				Thanks.

				Your friendly neighborhood system administrator.
				EOF
			done

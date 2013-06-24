#!/bin/bash - 
#===============================================================================
#
#          FILE: option_2.sh
# 
#         USAGE: ./option_2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年06月24日 22时12分35秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
file=	 verbose= 	quiet= 	 long=

while getopts f:vql opt
do
	case $opt in
	f) file=$OPTARG
		echo "option + -f"
		shift
		;;
	v) verbose=true
		quiet=
		echo "option + -v"
		;;
	q) quiet=true
		verbose=
		echo "option + -q"
		;;
	l) long=true
		echo "option + -l"
		;;
	esac
done

shift $((OPTIND -1)) #删除选项，留下参数


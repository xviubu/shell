#!/bin/bash - 
#===============================================================================
#
#          FILE: option_1.sh
# 
#         USAGE: ./option_1.sh 
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

while [ $# -gt 0 ]
do
	case $1 in
	-f) file=$2
		echo "option + -f"
		shift
		;;
	-v) verbose=true
		quiet=
		echo "option + -v"
		;;
	-q) quiet=true
		verbose=
		echo "option + -q"
		;;
	-l) long=true
		echo "option + -l"
		;;
	--) shift
		break
		;;
	-*) echo $0: $1: unrecognized option >&2
		;;
	*)  break;
		;;
	esac

	shift
done


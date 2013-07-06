#!/bin/bash - 
#===============================================================================
#
#          FILE: pathfind.sh
# 
#         USAGE: ./pathfind.sh 
# 
#   DESCRIPTION:  
#				 Search for one or more ordinary files or file patterns on a search
# 				 path defined by a specified environment variable.
#
#				 The output on standard output is normally either the full path
# 				 to the first instance of each file found on the search path,
#				 or "filename: not found" on standard error.
#
# 				The exit code is 0 if all files are found, and otherwise a
#				nonzero value equal to the number of files not found (subject
# 				to the shell exit code limit of 125).
#       OPTIONS: pathfind [--all] [--?] [--help] [--version] envvar patterns
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: lishan (xviubu), xviubu@gmail.com
#  ORGANIZATION: qdu
#       CREATED: 2013年07月02日 18时41分19秒 CST CST
#      REVISION:  ---
#===============================================================================

IFS=' 	
'   # 空格tab换行
OLDPATH="$PATH"
PATH=/bin:/usr/bin
export PATH
# 出错处理
error()
{
	echo "$@" 1>&2
	usage_and_exit 1
}

usage()
{
	echo "Usage: $PROGRAM [--all] [--?] [--help] [--version] envvar patterns  "
}

usage_and_exit()
{
	usage
	exit $1
}

version()
{
	echo "$PROGRAM version $VERSION"
}

warning()
{
	echo "$@" 1>&2
	EXITCODE=`expr $EXITCODE + 1`
}

all=no
envvar=
EXITCODE=0
PROGRAM=`basename $0`
VERSION=1.0
######处理选项
while  test $# -gt 0
do
	case $1 in 
	--all | --al | --a | -all | -al | -a ) 
		all=yes
		;;
	--help | --hel | --he | --h | '--?' | -help | -hel | -he | -h | '?')
		usage_and_exit 0
		;;
	--version | --versio | --versi | --vers | --vers | --ver | --ve | --v | -version | -versio | -versi | -vers | -vers | -ver | -ve | -v )  
		version
		exit 0 
		;;
	-*)
		error "Unrecognized option : $1"
		;;
	*)
		break
		;;
	esac
	shift
done

envvar="$1"
test $# -gt 0 && shift

test "X$envvar" = "XPATH"  && envvar=OLDPATH

dirpath=`eval echo '${'"$envvar"'}' 2>/dev/null | tr : ' '` 

if test -z "$envvar"
then 
	error Environment variable missing or empty
elif test "X$dirpath" = "X$envvar"
then 
	error "Broken sh on this platform: cannot expand $envvar"
elif test -z "$dirpath"
then
	error Empty directory search path
elif test $# -eq 0
then
	exit 0
fi


for pattern in "$@"
do
	result=
	for dir in $dirpath
	do
		for file in $dir/$pattern
		do 
			if test -f "$file"
			then 
				result="$file"
				echo "$result"
				test "$all" = "no" &&  break 2
			fi
		done
	done
	test -z "$result" && warning "$pattern: not found"
done

test $EXITCODE -gt 125 && EXITCODE=125

exit $EXITCODE

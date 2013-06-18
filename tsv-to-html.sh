#!/bin/bash
#将制表符分隔的文件转换为html

cat << EOFILE
<!DOCTYPE HTML PUBLIC "-//IFTF //DTD HTML // EN//3.0">
<HTML>
	<HEAD>
		<TITLE>
			Office directory
		</TITLE>
		<LINK REV="made" HREF="mailto:$USER@`hostname`">
	</HEAD>
	<BODY>
		<TABLE>	
EOFILE
sed -e 's=&=\&amp;=g' \
	-e 's=<=\&lt;=g' \
	-e 's=>=\&gt;=g' \
	-e 's=\t=</TD><TD>=g' \
	-e 's=^.*$=			<TR><TD>&</TD></TR>='
cat << EOFILE
		</TABLE>
	</BODY>
</HTML>
EOFILE

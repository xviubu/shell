#!/bin/bash
#	head

count=$(echo $1 | sed -e 's/^-//')
shift
sed ${count}q "$@"

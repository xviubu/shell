#!/bin/bash
#	head

count=$1
sed ${count}q "$2"

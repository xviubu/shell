#!/bin/bash
#merge-sales.sh

#删除注释行
sed '/^#/d' quotas | sort > quotas.sort
sed '/^#/d' sales  | sort > sales.sort

join quotas.sort sales.sort

rm quotas.sort sales.sort 

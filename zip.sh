#!/bin/bash
#zip code and send it to a backup server
code_path="***" #your code dir
username=xxx
userip=xxx.xx.xx.xx
userdir=xxx
logdir=xxx/xxx

file_list="${code_path}/a/*.py ${code_path}/a/*.txt ${code_path}/a/b"

zip -r ${code_path}/total_code.zip $file_list

scp ${code_path}/total_code.zip $username@$userip:$userdir

d=`date +%Y-%m-%d`
date +%Y-%m-%d\ %H:%M:%S >> $logdir/ziplog$d.log

rm_log_list=`find $logdir -mtime +7|grep -e ".*\.log"`
if [ ${#rm_log_list} -ge 10 ];then
	rm $rm_log_list
fi

#!/bin/bash
code_path="/home/lyx/code/"
segment_file="${code_path}segment/*.py ${code_path}segment/python ${code_path}segment/*.txt"

obj_file="${code_path}obj_det/python ${code_path}obj_det/test_cfgs ${code_path}obj_det/train_cfgs ${code_path}obj_det/tft_cfgs ${code_path}obj_det/result ${code_path}obj_det/*.py ${code_path}obj_det/run.sh ${code_path}obj_det/.run"

test_file="${code_path}test_det/python ${code_path}test_det/test_cfgs ${code_path}test_det/train_cfgs ${code_path}test_det/tft_cfgs ${code_path}test_det/result ${code_path}test_det/*.py ${code_path}test_det/run.sh ${code_path}test_det/.run"

zip -r ${code_path}total_code.zip $segment_file $obj_file $test_file

scp ${code_path}total_code.zip lyx@106.15.180.211:code_dir/

d=`date +%Y-%m-%d`
date +%Y-%m-%d\ %H:%M:%S >> /home/lyx/zip_log/ziplog$d.log

rm_log_list=`find /home/lyx/zip_log -mtime +7|grep -e ".*\.log"`
if [ ${#rm_log_list} -ge 10 ];then
	rm $rm_log_list
fi

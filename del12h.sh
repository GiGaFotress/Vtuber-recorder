#!/bin/sh
. /etc/profile
. ~/.bash_profile
source /etc/profile
find folder/Vtuber-recorder/savevideo/  -maxdepth 5 -name "*.ts"  -type f -mmin +720 -exec ls -l {} \; > "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 5 -name "*.ts"   -type f -mmin +720 -delete; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 5 -name "*.ts.*"  -type f -mmin +720 -exec ls -l {} \; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 5 -name "*.ts.*"  -type f -mmin +720 -delete; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 5 -name "*.info.txt"  -type f -mmin +720 -exec ls -l {} \; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 5 -name "*.info.txt"  -type f -mmin +720 -delete; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/ -maxdepth 5 -name "*.log*"  -type f -mmin +6000 -exec ls -l {} \; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/ -maxdepth 5 -name "*.log*"  -type f -mmin +6000 -delete; >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
pip3 install  --upgrade youtube-dl
pip3 install  --upgrade you-get
pip3 install  --upgrade streamlink





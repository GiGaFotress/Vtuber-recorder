find folder/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts"  -type f -mmin +720 -exec ls -l {} \ > "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts"   -type f -mmin +720 -delete >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +720 -exec ls -l {} \ >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +720 -delete >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.info.txt"  -type f -mmin +720 -exec ls -l {} \ >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.info.txt"  -type f -mmin +720 -delete >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -exec ls -l {} \ >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -delete >> "folder/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1





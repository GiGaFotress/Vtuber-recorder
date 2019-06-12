find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts"  -type f -mmin +240 -exec ls -l {} \ > "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts"   -type f -mmin +240 -delete >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +240 -exec ls -l {} \ >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +240 -delete >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.info.txt"  -type f -mmin +240 -exec ls -l {} \ >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.info.txt"  -type f -mmin +240 -delete >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -exec ls -l {} \ >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -delete >> "FOLDER/Vtuber-recorder/log/del12h$(date +"[%Y-%m-%d-%H]").log" 2>&1





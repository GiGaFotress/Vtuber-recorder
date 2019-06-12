find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts"  -type f -mmin +240 -exec ls -l {} \;
find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts"   -type f -mmin +240 -exec rm  {} \;
find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +240 -exec ls -l {} \;
find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +240 -delete ;
find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.info.txt"  -type f -mmin +240 -exec ls -l {} \;
find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3  -name "*.info.txt"  -type f -mmin +240 -delete ;
find /home/centos/Vtuber-recorder/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -exec ls -l {} \;
find /home/centos/Vtuber-recorder/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -delete ;





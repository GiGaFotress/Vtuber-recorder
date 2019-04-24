find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts"  -type f -mmin +180 -exec ls -l {} \;
find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts"   -type f -mmin +180 -exec rm  {} \;
find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +180 -exec ls -l {} \;
find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +180 -delete ;



find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts"  -type f -mmin +300 -exec ls -l {} \;
find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts"   -type f -mmin +300 -exec rm  {} \;
find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +300 -exec ls -l {} \;
find /home/centos/Recorder/savevideo/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +300 -delete ;
find /home/centos/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -exec ls -l {} \;
find /home/centos/log/ -maxdepth 1  -name "*.log*"  -type f -mmin +6000 -delete ;
#find /home/centos/Recorder/ -maxdepth 3    -name "*.ts"   -type f -mmin +720 -exec ls -l  {} \;;
#find /home/centos/Recorder/ -maxdepth 3    -name "*.ts.log"   -type f -mmin +720 -exec ls -l  {} \;;
#find /home/centos/Recorder/  -maxdepth 3    -name "*.ts"   -type f -mmin +720 -exec rm  {} \;;
#find /home/centos/Recorder/ -maxdepth 3    -name "*.ts.log"   -type f -mmin +720 -exec rm  {} \;;




find /home/centos/Vtuber-recorder/savevideo/*/bil/  -maxdepth 3  -name "*.ts"  -type f -mmin +90 -exec ls -l {} \;
find /home/centos/Vtuber-recorder/savevideo/*/bil/ -maxdepth 3  -name "*.ts"   -type f -mmin +90-exec rm  {} \;
find /home/centos/Vtuber-recorder/savevideo/*/bil/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +90 -exec ls -l {} \;
find /home/centos/Vtuber-recorder/savevideo/*/bil/  -maxdepth 3  -name "*.ts.*"  -type f -mmin +90 -delete ;
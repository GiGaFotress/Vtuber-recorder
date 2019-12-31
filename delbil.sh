find folder/Vtuber-recorder/savevideo/*/bil/  -maxdepth 5  -name "*.ts"  -type f -mmin +90 -exec ls -l {} \;
find folder/Vtuber-recorder/savevideo/*/bil/ -maxdepth 5  -name "*.ts"   -type f -mmin +90-exec rm  {} \;
find folder/Vtuber-recorder/savevideo/*/bil/  -maxdepth 5  -name "*.ts.*"  -type f -mmin +90 -exec ls -l {} \;
find folder/Vtuber-recorder/savevideo/*/bil/  -maxdepth 5  -name "*.ts.*"  -type f -mmin +90 -delete ;

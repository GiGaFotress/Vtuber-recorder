find /home/centos/Recorder/savevideo/  -maxdepth 4    -name "*.*"  -size 0 -type f  -exec ls -l  {} \;
find /home/centos/Recorder/savevideo/ -maxdepth 4 -name "*.*" -size 0 -type f -delete ;
find /home/centos/Recorder/ -maxdepth 4    -name "*.ts.log"   -type f -size -35k  -exec ls -l  {} \;
find /home/centos/Recorder/ -maxdepth 4    -name "*.ts.log"   -type f -size -35k  -delete  ;
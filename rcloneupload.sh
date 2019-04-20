find /home/centos/Recorder/savevideo/  -maxdepth 3    -name "*.*"  -size 0 -type f  -exec ls -l  {} \;
find /home/centos/Recorder/savevideo/ -maxdepth 3 -name "*.*" -size 0 -type f -delete ;
find /home/centos/Recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -exec ls -l  {} \;
find /home/centos/Recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -delete  ;
find /home/centos/Recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -exec ls -l  {} \;
find /home/centos/Recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -delete ;
rclone copy /home/centos/Recorder/savevideo savevideo:/path/ --buffer-size 10M  --transfers 3 --low-level-retries 200 -v 
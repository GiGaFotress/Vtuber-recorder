find /home/centos/Vtuber-recorder/savevideo/  -maxdepth 3    -name "*.*"  -size 0 -type f  -exec ls -l  {} \;
find /home/centos/Vtuber-recorder/savevideo/ -maxdepth 3 -name "*.*" -size 0 -type f -delete ;
find /home/centos/Vtuber-recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -exec ls -l  {} \;
find /home/centos/Vtuber-recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -delete  ;
find /home/centos/Vtuber-recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -exec ls -l  {} \;
find /home/centos/Vtuber-recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -delete ;
rclone move /home/centos/Vtuber-recorder/savevideo savevideo:/path/ --include *.ts --include *.log --buffer-size 32M  --transfers 6 --low-level-retries 200 -v

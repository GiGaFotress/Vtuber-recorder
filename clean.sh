find folder/Vtuber-recorder/savevideo/  -maxdepth 4    -name "*.*"  -size 0 -type f  -exec ls -l  {} \;
find folder/Vtuber-recorder/savevideo/ -maxdepth 4  -name "*.*" -size 0 -type f -delete ;
find folder/Vtuber-recorder/savevideo/ -maxdepth 4    -name "*.ts.log"   -type f -mmin +6000 -size -35k  -exec ls -l  {} \;
find folder/Vtuber-recorder/savevideo/ -maxdepth 4    -name "*.ts.log"   -type f -mmin +6000 -size -35k  -delete  ;

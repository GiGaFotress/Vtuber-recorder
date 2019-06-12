find FOLDER/Vtuber-recorder/savevideo/  -maxdepth 3    -name "*.*"  -size 0 -type f  -exec ls -l  {} \ > "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/savevideo/ -maxdepth 3 -name "*.*" -size 0 -type f -delete >> "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -exec ls -l  {} \ >> "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -delete  >> "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -exec ls -l  {} \ >> "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find FOLDER/Vtuber-recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -delete >> "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
rclone move FOLDER/Vtuber-recorder/savevideo savevideo:/path/ --include *.ts  --buffer-size 32M  --transfers 6 --low-level-retries 200 -v >> "FOLDER/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1

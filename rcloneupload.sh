find folder/Vtuber-recorder/savevideo/  -maxdepth 3    -name "*.*"  -size 0 -type f  -exec ls -l  {} \; > "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/savevideo/ -maxdepth 3 -name "*.*" -size 0 -type f -delete; >> "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -exec ls -l  {} \; >> "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/ -maxdepth 3    -name "*.ts.log"   -type f -size -35k  -delete;  >> "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -exec ls -l  {} \; >> "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
find folder/Vtuber-recorder/ -maxdepth 3    -name "*.ts"   -type f -size 1M  -delete; >> "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1
rclone move folder/Vtuber-recorder/savevideo savevideo:/path/ --include *.ts  --buffer-size 32M  --transfers  4 --retries 6  --retries-sleep 2m --low-level-retries 300  -v >> "folder/Vtuber-recorder/log/rclone$(date +"[%Y-%m-%d-%H]").log" 2>&1

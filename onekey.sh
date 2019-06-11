#root运行
root(){
        if [[ $EUID -ne 0 ]]; then
        echo "${Red}Error:请使用root运行该脚本！"${Font} 1>&2
        exit 1
        fi
}
#开始菜单
#输入twitchkey
#获取绝对路径后https://blog.csdn.net/10km/article/details/51906821
python(){
 yum -y install epel-release
 yum -y install https://centos7.iuscommunity.org/ius-release.rpm
 yum -y install python36
 yum -y install python36-pip
cd /usr/bin
mv python python.bak
ln -s /usr/bin/python3.6 /usr/bin/python

# vi /usr/bin/yum#替换Python为python2
sed -i 's/python/python2/g' /usr/bin/yum
# vi /usr/libexec/urlgrabber-ext-down
sed -i 's/python/python2/g' /usr/libexec/urlgrabber-ext-down
#两个文件均修改开头的python为python2
 pip3 install youtube-dl
 pip3 install you-get
 pip3 install streamlink
}
#封装FFmpeg
ffmpeg(){
cd /
yum -y install golang wget git unzip screen
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
tar -xvf ffmpeg-release-amd64-static.tar.xz
rm -rf ffmpeg-release-amd64-static.tar.xz
FFILE=$(find . -name ffmpeg)
FFPFILE=$(find . -name ffprobe)
mv $FFILE  /usr/bin
mv $FFPFILE /usr/bin

#清理ffmpeg安装
}
#安装go依赖
goinstall(){
go get github.com/gorilla/websocket
go get golang.org/x/crypto/sha3
go get github.com/mattn/go-sqlite3
go get github.com/gin-gonic/gin
}
gitcode(){
cd "$RECFOLDER"
git clone https://github.com/GiGaFotress/Vtuber-recorder.git
chmod -R 777 ./Vtuber-recorder
#添加twitch申请的apikey
cd ./Vtuber-recorder
sed -i 's/key/$TWITCHAPIKEY/g' record_twitch.sh
#https://www.zhukun.net/archives/8137
#运行log保存(变量代替目录名字)
}
rclone()
{
curl https://rclone.org/install.sh | sudo bash
sed -i 's/FOLDER/$RECFOLDER/g' rcloneupload.sh
sed -i 's/FOLDER/$RECFOLDER/g' clean.sh
sed -i 's/FOLDER/$RECFOLDER/g' del12h.sh
(crontab -l ; echo "* */1 * * * flock -xn /tmp/test.lock -c "$RECFOLDER/Vtuber-recorder/rcloneupload.sh" > "$RECFOLDER/Vtuber-recorder/log/rclone$(date +"[\%Y-\%m-\%d \%H:\%M:\%S]").log" 2>&1") | crontab -
(crontab -l ; echo "* */3 * * * flock -xn /tmp/test1.lock -c "$RECFOLDER/Vtuber-recorder/del12h.sh" > "$RECFOLDER/Vtuber-recorder/log/del12h$(date +"[\%Y-\%m-\%d \%H:\%M:\%S]").log" 2>&1") | crontab -
(crontab -l ; echo "*/1 * * * * flock -xn /tmp/test2.lock -c "$RECFOLDER/Vtuber-recorder/clean.sh" >/dev/null 2>&1") | crontab -
}

#最后运行
bbr(){
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}

#启动部分，函数需要在前声明才可使用
main(){
root
clear
echo -e "———————————————————————————————————————"
echo -e "${Blue}油管b站TC老鼠台一键环境配置脚本 for CentOS 7${Font}"
echo -e "———————————————————————————————————————"
read -p "请输入Twitchkey:" TWITCHAPIKEY
read -p "请输入希望安装录播系统的目录(目录最后请勿带有斜杠):" RECFOLDER
python
ffmpeg
goinstall
gitcode
rclone
bbr
}
main

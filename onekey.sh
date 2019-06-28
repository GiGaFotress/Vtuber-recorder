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
timedatectl set-timezone Asia/Shanghai
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
yum -y install golang wget git unzip screen psmisc
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
sed -i "s/key/$TWITCHAPIKEY/g" record_twitch.sh
#https://stackoverflow.com/questions/584894/environment-variable-substitution-in-sed
#sed在变量含有/时会失效，需要更换分隔符
sed -i "s|folder|$RECFOLDER|g" rcloneupload.sh
sed -i "s|folder|$RECFOLDER|g" clean.sh
sed -i "s|folder|$RECFOLDER|g" del12h.sh
#https://www.zhukun.net/archives/8137
#运行log保存(变量代替目录名字)
echo "logfile $RECFOLDER/Vtuber-recorder/log/screenlog_%t.log" >> /etc/screenrc
}
rclone()
{
curl https://rclone.org/install.sh | sudo bash
(crontab -l ; echo "* */1 * * * flock -xn /tmp/test.lock -c "$RECFOLDER/Vtuber-recorder/rcloneupload.sh" >/dev/null 2>&1") | crontab -
(crontab -l ; echo "* */2 * * * flock -xn /tmp/test1.lock -c "$RECFOLDER/Vtuber-recorder/del12h.sh" >/dev/null 2>&1") | crontab -
(crontab -l ; echo "*/1 * * * * flock -xn /tmp/test2.lock -c "$RECFOLDER/Vtuber-recorder/clean.sh" >/dev/null 2>&1") | crontab -
}
visualmem(){
dd if=/dev/zero of=/var/swapfile bs=1024 count=2097152
mkswap /var/swapfile
swapon /var/swapfile
chmod -R 0600 /var/swapfile
echo  "/var/swapfile   swap  swap  defaults  0  0" >>  /etc/fstab
}

#最后运行
bbr(){
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}

readkey(){
clear
read -p "请输入Twitchkey:" TWITCHAPIKEY
read -p "请输入希望安装录播系统的目录(目录最后请勿带有斜杠):" RECFOLDER
}
gitupdate()
{
cd "$RECFOLDER"
cd ./Vtuber-recorder
git reset --hard
git pull origin
chmod -R 777 ./Vtuber-recorder
#添加twitch申请的apikey
cd ./Vtuber-recorder
sed -i "s/key/$TWITCHAPIKEY/g" record_twitch.sh
#https://stackoverflow.com/questions/584894/environment-variable-substitution-in-sed
#sed在变量含有/时会失效，需要更换分隔符
sed -i "s|folder|$RECFOLDER|g" rcloneupload.sh
sed -i "s|folder|$RECFOLDER|g" clean.sh
sed -i "s|folder|$RECFOLDER|g" del12h.sh
#https://www.zhukun.net/archives/8137
#运行log保存(变量代替目录名字)
echo "logfile $RECFOLDER/Vtuber-recorder/log/screenlog_%t.log" >> /etc/screenrc
}
update(){
root
readkey
gitupdate
}

installbash(){
root
readkey
python
ffmpeg
goinstall
gitcode
bbr
}

installwithoutvmem(){
root
readkey
python
ffmpeg
goinstall
gitcode
rclone
bbr
}

install_all(){
root
readkey
python
ffmpeg
goinstall
gitcode
rclone
visualmem
bbr
}

start_menu(){
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
clear
echo && echo -e " 
 ${Blue}油管b站TC老鼠台一键环境配置脚本 for CentOS 7${Font}
 ${Green_font_prefix}0.${Font_color_suffix} 升级脚本
 ${Green_font_prefix}1.${Font_color_suffix} 只安装录制环境
 ${Green_font_prefix}2.${Font_color_suffix} 安装录制环境同时也安装自动上传环境${Red_font_prefix}(不安装虚拟内存)${Font_color_suffix}
 ${Green_font_prefix}3.${Font_color_suffix} 安装录制环境同时也安装自动上传环境${Red_font_prefix}(带有虚拟内存)${Font_color_suffix}
 ${Green_font_prefix}4.${Font_color_suffix} 退出
" && echo
	
echo
read -p " 请输入数字 [0-11]:" num
case "$num" in
	0)
	update
	;;
	1)
	installbash
	;;
	2)
	installwithoutvmem
	;;
	3)
	install_all
	;;
	4)
	exit 1
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-4]"
	sleep 5s
	start_menu
	;;
esac
}
start_menu

# Vtuber-recorder
VTB多平台全自动录制
-----------------------------------------------------

环境依赖:ffmpeg,streamlink,biliroku-lite,livedl,youget,youtube-dl

自动上传和清理依赖:rclone(这玩意极占内存,请注意低于2G内存的机器开启1G以上swap),crontab

添加一键部署脚本

wget -N --no-check-certificate "https://raw.githubusercontent.com/GiGaFotress/Vtuber-recorder/master/onekey.sh" && chmod +x onekey.sh && ./onekey.sh

仅用于awsligthsail的centos7上测试通过，包含ffmpeg,streamlink,livedl,youget,youtube-dl,rclone（带有2G虚拟内存）,以及tcp加速软件（bbr锐速可选）

出现问题请勿多次运行,升级选项会强制同步所有脚本,请提前备份config和自己修改过的脚本部分

~~未来预期添加选项让rclone等可选~~

-----------------------------------------------------
使用方法
新建一个txt文件放入脚本目录的config文件夹,并填入某个vtb的所有直播平台连接和你希望保存的路径(路径请使用绝对路径),每行一个

config文件夹的example下有示例文件

~~注意,youtube监测脚本需要根据服务器所在地进行调整~~

~~使用wget下载随意正在直播的频道,然后搜索span class="yt-badge  yt-badge-live"~~

~~后面的文字为直播中的各语言表达,填入脚本中~~

以及twitch监测脚本需要自行去https://dev.twitch.tv/
注册一个应用并自行填入


自动清理脚本中需要手动修改路径（一键脚本安装的不需要）
----------------------------------------------------------------

一键启动脚本为lazyrun.sh,使用前先确定你所有的录制部分的配置均已完成,它会遍历config下的所有文件并且使用screen创建进程.

------------------------------------------------------------
启动指令

./index.sh [name]     [format] ~~[loop|once][interval]现在在文件内指定~~

./index.sh txt文件名 需求的录像质量 ~~是否循环 每次循环检查时间 

例如./index.sh yumeno_shiori best 

format会产生bug请尽量只使用best

关闭指令

全部关闭: screen -ls|awk 'NR>=2&&NR<=20{print $1}'|awk '{print "screen -S "$1" -X quit"}'|sh

20那个数字是目录下配置文件数量

关闭单个人的所有录制可以关闭某个screen 

关闭单个人的单个录制请使用./manager.sh 并输入需要结束的配置文件名

------------------------------------------------------------

录像存储位置为脚本目录的savevideo下

需求自动上传和清理请将rcloneupload.sh,del12h.sh,warndel.sh加入crontab中

在这之前请确定你的rclone挂载并在这些脚本内修正你的文件目录

------------------------------------------------------------
现版本bug
~~1.tc台的录制不会产生在设定目录~~

~~2.脚本无法终止,要么全关了,要么全开着~~

~~3.如果txt内没有写入目录并不会报错~~

~~4.进程结束后pid仍然缓存在running.txt下一次重启后将无法使用manager关闭当前进程~~

5.重启之后running文件内的信息并未清空将会与新产生的pid冲突,解决办法是重启后手动删除文件

6.manager击杀单进程后无法单独启动,只能一次全部击杀单人所有进程

7.trap获取pid并在主程序结束时结束所有子进程失败(曲线救国直接结束screen进程)

------------------------------------------------------------
愿景:
~~0.添加批量运行脚本(最优先完成)~~

1.添加菜单

2.添加iriam录制(梦里)

~~3.监测机制使用更低资源占用~~

~~4.添加b站独播判断省的每天都是双倍的占用(优先度高)~~ b站刚才一波空推流把循环系统耗死在上面了,为了容错暂时搁置

~~5.添加清理脚本在上传前把日志传输到专用日志文件夹~~自动清理已经部署，需求新的监测脚本运行状况

6.降低监测间隔测试安定性




------------------------------------------------------------
screen调试

在screen配置文件/etc/screenrc最后添加下面一行：

logfile /tmp/screenlog_%t.log

-------------------------------------------------------------------
## 赞助服务器 ##

![](https://i.niupic.com/images/2019/06/13/_1021.png) 

--------------------------------------------------------------------

感谢https://github.com/printempw/live-stream-recorder 的基础脚本 

#! /bin/bash
#ubuntu

echo '请确认您的要安装ffmpeg目录是否易找到，是请输入yes，否则crtl + c退出:' | xargs echo -n
read ans
if [ $ans == yes ]; then
    #下载ffmpeg并解压，目录设置为自己所在目录
    echo '开始下载ffmpeg'
    wget http://www.ffmpeg.org/releases/ffmpeg-5.1.tar.gz

    tar -zxvf ffmpeg-5.1.tar.gz
    echo '下载解压完成'

    #打开和编译
    cd ffmpeg-5.1/

    echo '安装yasm（有yasm的话就不用管）'
    apt install yasm pkg-config libopencore-amrnb-dev libopencore-amrwb-dev
    echo '安装yasm完成'

    #编译
    echo '此过程可能比较漫长,请耐心等候'

    ./configure --enable-gpl --enable-version3 --enable-nonfree --disable-ffplay --disable-ffprobe --enable-libopencore-amrnb --enable-libopencore-amrwb

    make

    make install

    echo '手动编译完成，恭喜!'

    #指示如何配置环境路径
    dir=$(pwd)
    echo "请将 ${dir}/ffmpeg 添加到登录过的云崽的config/config/bot.yaml的ffmpeg_path中,建议通过锅巴登录进行添加"
    echo '可根据需要改变环境变量'
else
    exit
fi

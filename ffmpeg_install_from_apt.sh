#! /bin/bash
#ubuntu

#有关ffmpeg的下载和编译，此处采用包安装的方式
#若本方法使用后仍无法使用ffmpeg,请使用手动下载编译
echo '开始安装ffmpeg'
if ! type ffmpeg >/dev/null 2>&1; then
    sudo apt install ffmpeg -y
    echo 'ffmpeg安装成功,导入环境变量'
    echo 'export PATH=/usr/bin/ffmpeg:$PATH' >>~/.bashrc
    source ~/.bashrc
    echo '导入环境变量成功'
else
    echo 'ffmpeg已安装'
fi
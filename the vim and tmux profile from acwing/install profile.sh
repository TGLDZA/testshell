#! /bin/bash

#本脚本用于毛坯服务器的基本配置

echo "开始安装和更新相关环境依赖"
apt update              #列出可更新的软件清单
apt-get install -y sudo #安装sudo权限  -y表示执行过程中全部是yes
apt-get install -y curl #安装curl,curl是用于请求web服务器的工具
sudo apt-get install -y build-essential  #安装日常开发需要用的包

#安装中文字体
sudo apt-get install -y ttf-wqy-microhei  #文泉驿-微米黑
sudo apt-get install -y ttf-wqy-zenhei  #文泉驿-正黑
sudo apt-get install -y xfonts-wqy #文泉驿-点阵宋体
sudo fc-cache -fv
echo '临时设置中文语言'
LANG="zh_CN.UTF-8"

#安装tmux
echo '开始安装tmux'
sudo apt install -y tmux;

#安装vim
echo '开始安装vim'
sudo apt install -y vim;


#安装git
echo "开始安装git"
apt install git -y
git config --global http.sslVerify false #去除https的ssl验证，方便拉取项目
echo "安装git完成"

#安装man-db
echo '开始安装man-db'
apt install -y man-db

#安装tree
echo '开始安装tree'
apt install -y tree;

#安装wget
echo '开始安装wget'
apt install -y wget;

#安装zip 7z convmv
echo '开始安装zip 7z convmv'
sudo apt -y install zip unzip convmv p7zip-full
echo '安装完成，基本使用方法：';
echo 'zip file.zip  unzip file.zip';
echo 'convmv -f gbk -t utf-8 -r --notest /home/wwwroot';
echo '7z x file.7z';

echo '基本环境部署完成'
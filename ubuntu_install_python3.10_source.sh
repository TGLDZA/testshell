#! /bin/bash

#ubuntu

#comes from https://computingforgeeks.com/how-to-install-python-on-ubuntu-linux-system/

echo '更新软件源并安装所需依赖';
sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y

echo '通过wget安装python源码'
wget https://www.python.org/ftp/python/3.10.6/Python-3.10.6.tgz
tar -xf Python-3.10.*.tgz
cd Python-3.10.*/
./configure --enable-optimizations
make -j $(nproc)    #nproc获取系统核数
sudo make altinstall    #Here altinstall is used instead of install in order to keep the default Python binary path in /usr/bin/python.
echo 'python3.10编译完成';
echo '为python3.10建立软链接,替换python输出'
mv /usr/bin/python /usr/bin/python.bak
ln -s /usr/bin/python3.10 /usr/bin/python


echo '安装python3-pip'
sudo apt install python3-pip


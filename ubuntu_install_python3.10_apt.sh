#! /bin/bash
# ubuntu
# comes from https://computingforgeeks.com/how-to-install-python-on-ubuntu-linux-system/
echo '先更新一波依赖——'
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common -y
echo '直接enter'
sudo add-apt-repository ppa:deadsnakes/ppa
echo '软件包安装python3.10'
sudo apt install python3.10 -y
echo '为python3.10建立软链接,替换python输出'
mv /usr/bin/python /usr/bin/python.bak
ln -s /usr/bin/python3.10 /usr/bin/python

echo '优先采用apt方式安装pip'
sudo apt install python3-pip

if ! type pip >/dev/null 2>&1; then
    echo '更换方式安装pip'
    echo '软件包安装pip及其依赖'
    apt install -y python3.10-distutils
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
fi;

echo '输入pip -V 或 python -V 查看是否安装成功';


# python#.#-dev: 构建 C extensions 的依赖包（用于开发）
# python#.#-venv: 提供标准的 venv module
# python#.#-distutils: 提供标准 distutils module
# python#.#-lib2to3: 提供 2to3-#.# 工具 以及标准 lib2to3 module
# python#.#-gdbm: 提供标准 dbm.gnu module
# python#.#-tk: 提供标准 tkinter module

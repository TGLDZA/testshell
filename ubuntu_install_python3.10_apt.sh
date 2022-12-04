#! /bin/bash
# ubuntu
# comes from https://computingforgeeks.com/how-to-install-python-on-ubuntu-linux-system/
echo '先更新一波依赖——'
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common -y
echo '直接enter'
sudo add-apt-repository ppa:deadsnakes/ppa    #给源列表导入deadsnakes PPA
echo '软件包安装python3.10'
sudo apt install python3.10 -y
echo '为python3.10建立软链接,替换python输出'
mv /usr/bin/python /usr/bin/python.bak
ln -s /usr/bin/python3.10 /usr/bin/python
apt install -y python3.10-distutils    #安装模块依赖

echo '优先采用apt方式安装pip'
sudo apt install python3-pip
#为原链接备份并将pip链接至pip3.10
echo '为pip创建软链接'
mv /usr/bin/pip /usr/bin/pip.bak
ln -s /usr/local/bin/pip3.10 /usr/bin/pip

#若上述pip并未装到python3.10的包列表中，则选择以下方式重装pip
if ! type pip >/dev/null 2>&1; then
    echo '更换方式安装pip，可能会出现网络问题导致超时'
    echo '软件包安装pip及其依赖'
    apt install -y python3.10-distutils
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
    if [ $? == 0 ]; then
        echo "pip3.10安装成功"
    else
        echo "pip3.10安装失败，很可能是网络问题导致超时，请重试或者百度解决方法"
        exit 1
    fi;
fi;

echo '输入pip -V 或 python -V 查看是否安装成功';


# python#.#-dev: 构建 C extensions 的依赖包（用于开发）
# python#.#-venv: 提供标准的 venv module
# python#.#-distutils: 提供标准 distutils module
# python#.#-lib2to3: 提供 2to3-#.# 工具 以及标准 lib2to3 module
# python#.#-gdbm: 提供标准 dbm.gnu module
# python#.#-tk: 提供标准 tkinter module



# 参考：https://zhuanlan.zhihu.com/p/418368712
# 参考：https://computingforgeeks.com/how-to-install-python-on-ubuntu-linux-system/
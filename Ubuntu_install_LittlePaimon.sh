#! /bin/bash
#ubuntu

#请选好你的路径防止找不到
#请选好你的路径防止找不到
#请选好你的路径防止找不到
#请选好你的路径防止找不到
#请选好你的路径防止找不到

echo '开始搭配环境'
echo '先更新一波依赖——'
sudo apt update && sudo apt upgrade -y
echo '安装前置依赖'
apt install -y gcc* make libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel
sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm-dev


#安装poetry
echo '开始安装poetry'
if ! type poetry >/dev/null 2>&1; then
    pip install poetry
    echo 'poetry安装成功,可使用poetry -V查看是否成功'
else
    echo 'poetry已安装'
fi

#安装git
echo "开始安装git"
apt install git -y
echo "安装git完成"


#复制小派蒙
if [ ! -d LittlePaimon/ ]; then
    echo '开始安装小派蒙,优先选择Github，如果下载缓慢，再尝试Gitee'
    git clone --depth=1 https://github.com/CMHopeSunshine/LittlePaimon
    if [ ! -d LittlePaimon/ ]; then
        echo '正在切换gitee下载'
        git clone --depth=1 https://gitee.com/CherishMoon/LittlePaimon
        if [ ! -d LittlePaimon/ ]; then
            echo '小派蒙安装失败'
            exit
        else
            echo '小派蒙安装成功'
        fi
    fi
fi

#开始安装依赖
echo '开始安装依赖'
cd LittlePaimon/
poetry install

echo '安装go-cq插件'
poetry run nb plugin install nonebot-plugin-gocqhttp

echo '小派蒙已安装完成，但是配置项需要自行配置'
echo '请查看https://docs.paimon.cherishmoon.fun/guide/paimon-install.html    的安装指南进行配置,可使用vim .env.prod'
echo '启动bot使用poetry run nb run ，请先登录go-cq'

echo '脚本结束，恭喜你部署完成！'

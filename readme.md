# 萌新练习shell（本仓库为本人练习所用）
## 个人练习脚本语言编写，酌情使用
## 介绍
支持机器人的部署，正在不断练习中，看描述即可
### Yunzai-Bot部署（已过时）
目前支持的系统：
安卓ubuntu18.04
服务器ubuntu20.04

如果是毛坯服务器，建议可以先使用install profile.sh
```
apt update
apt install curl -y
curl -sL https://gitee.com/piedianz/testshell/raw/dev/the_vim_and_profile_from_acwing/install_profile.sh | sudo -E bash -
```

其他的没有测试过，有勇士的话可以尝试下

记得看说明.txt!!!

目前支持的版本：（不要做v2钉子户）
[Yunzai-Bot v3](https://gitee.com/Le-niao/Yunzai-Bot)

目前一键部署下载的插件包：
- [喵喵插件](https://gitee.com/yoimiya-kokomi/miao-plugin)：查询游戏内角色面板
- [锅巴插件](https://github.com/guoba-yunzai/guoba-plugin)：Yunzai-Bot的扩展插件，主要提供后台管理界面
- [碎月插件](http://gitee.com/Acceleratorsky/suiyue)：群聊娱乐功能，疯狂星期四，疫情查询等
- [抽卡插件](https://gitee.com/Nwflower/flower-plugin)：自定义模拟抽卡,自动更新内存群名片
- [土块插件](https://gitee.com/SmallK111407/earth-k-plugin)：可视化点歌与原神角色背景故事等
- [图鉴插件](https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin)：提供角色、武器、原魔、食物等图鉴内容
- [py-plugin](https://gitee.com/realhuhu/py-plugin):提供py类型的多种功能
- [戏天插件管理器](https://github.com/XiTianGame/xitian-plugin):在线安装管理插件等功能
- [椰奶插件](https://gitee.com/yeyang52/yenai-plugin):扩展插件，提供对Bot的一些便捷操作
#### 服务器部署
1. curl执行
```
apt update && apt install sudo -y
sudo su root
apt install curl -y
curl -sL https://gitee.com/piedianz/testshell/raw/dev/Ubuntuinstallyz.sh | sudo -E bash -
```
2. 直接执行文件(推荐)
```
apt update && apt install sudo -y
sudo su root
apt install -y git
git clone https://gitee.com/piedianz/testshell
cp testshell/Ubuntuinstallyz.sh test.sh
bash test.sh
```
#### 手机端部署
先下载下面两个软件
- termux下载地址：https://f-droid.org/repo/com.termux_118.apk
- 滑动验证助手下载地址：https://maupdate.rainchan.win/txcaptcha.apk  
依次在termux中输入如下代码
```
pkg install proot git python -y
```
```
git clone https://gitee.com/Le-niao/termux-install-linux.git
cd termux-install-linux 
python termux-linux-install.py
```
此时输入1，选择安装ubuntu；
```
cd ~/Termux-Linux/Ubuntu
./start-ubuntu.sh
```
执行脚本方式同服务器方式，若是redis没有正常安装或者启动就用其他方法或百度，其余部分有效

!!! 手机上本脚本安装的redis无法可能正常使用，手机端部署最好使用时雨佬的脚本[TRSS Yunzai: TRSS Yunzai 云崽机器人 (gitee.com)](https://gitee.com/TimeRainStarSky/TRSS_Yunzai)

使用如下代码启动Yunzai
```
cd Yunzai-Bot
node app
```
若上述安装结束后无法使用ffmpeg，请使用手动下载编译ffmpeg.sh或者自行百度安装

关于python3.10看自己需要
使用方法就是bash 文件名.sh

不懂多百度

#### 问题描述
1. 装pnpm或者是其他模块太久，可以尝试更换npm下载源
```bash
npm config set registry https://registry.npm.taobao.org
npm config get registry 
```

2. node版本过低

   ```bash
   升级node
   npm cache clean -f && npm install n -g
   n stable 或者安装指定版本
   node -v查看是否升级成功
   若上述方法没升级成功则1.可能是n的安装路径未与node对应
   2.在安装完node新版本会有提示原路径node和新路径node
   比如我升级完在新版本在/usr/local/bin/node而旧版本在/usr/bin/node，此时只要建立一个软链接就行
   mv /usr/bin/node /usr/bin/node.bak && ln -s /usr/local/bin/node /usr/bin/node
   详细解决办法可参考https://www.jianshu.com/p/d934d3ba67ec
   ```

   

   

### 小派蒙部署

- 首先克隆本项目
```
git clone https://gitee.com/piedianz/testshell.git
```
- 毛坯服务器的配置文件（可选）
```
cp 'testshell/the_vim_and_tmux_profile_from_acwing/install_profile.sh' 'install_profile.sh'
bash install_profile.sh
```
- python3.10及pip的安装（有python3.8以上可以不用安装）
```
cp 'testshell/ubuntu_install_python3.10_apt.sh' PY.sh
bash PY.sh
```
- 小派蒙的安装（一定要有python环境）
```
cp 'testshell/Ubuntu_install_LittlePaimon.sh' PM.sh
bash PM.sh
```
- ffmpeg的手动编译安装（可选）
```
cp 'testshell/ffmpeg_by_make.sh' FM.sh
bash FM.sh
```
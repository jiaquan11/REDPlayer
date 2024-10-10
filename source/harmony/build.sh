# HAR compile shell:
#hvigorw="/Applications/DevEco-Studio.app/Contents/tools/hvigor/bin/hvigorw" ## replace your hvigorw path
#ohpm="/Applications/DevEco-Studio.app/Contents/tools/ohpm/bin/ohpm" ## replace your ohpm path

#1、windows上使用类unix环境比如Git Bash可以运行build.sh脚本成功
#2、需要在windows中配置环境变量如下所示
#D:\Program Files\Huawei\DevEco Studio\tools\hvigor\bin
#D:\Program Files\Huawei\DevEco Studio\tools\ohpm\bin
#需要配置DEVECO的环境变量如下：
#DEVECO_SDK_HOME->D:\Program Files\Huawei\DevEco Studio\sdk
#3、需要安装nodejs的工具，下载安装即可

rm -rf ./redplayerproxy/build
rm -rf oh_modules
rm -rf entry/oh_modules
mkdir output
rm -rf output/redplayerproxy.har
hvigorw clean --no-daemon
hvigorw assembleHar --mode module -p module=redplayerproxy@default -p product=default --no-daemon
cp redplayerproxy/build/default/outputs/default/redplayerproxy.har output/redplayerproxy.har
ohpm install
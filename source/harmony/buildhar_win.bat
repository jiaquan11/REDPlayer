@echo off  

REM 检查并删除目录  
if exist redplayerproxy\build (  
    rmdir /s /q redplayerproxy\build  
)  

if exist oh_modules (  
    rmdir /s /q oh_modules  
)  

if exist entry\oh_modules (  
    rmdir /s /q entry\oh_modules  
)  

REM 检查并创建输出目录  
if not exist output (  
    mkdir output  
)  

REM 检查并删除文件  
if exist output\redplayerproxy.har (  
    del /q output\redplayerproxy.har  
)  

REM 执行hvigorw命令  
call hvigorw clean --no-daemon

call hvigorw assembleHar --mode module -p module=redplayerproxy@default -p product=default --no-daemon 

REM 复制文件  
copy redplayerproxy\build\default\outputs\default\redplayerproxy.har output\redplayerproxy.har  

REM 执行ohpm命令  
call ohpm install  

@echo on  
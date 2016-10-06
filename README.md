## Minecraft Server Images.
PS：[制作教程](http://blog.bluerain.io/2016/10/04/minecraft-docker/)
### 包括的版本：
注：默认的 latest 版本是 1.10   
* 1.9.4 [(Dockerfile)](https://github.com/HentaiMew/docker-minecraft/blob/master/1.9/Dockerfile)
* 1.8.9 [(Dockerfile)](https://github.com/HentaiMew/docker-minecraft/blob/master/1.8/Dockerfile)
* 1.7.10 [(Dockerfile)](https://github.com/HentaiMew/docker-minecraft/blob/master/1.7/Dockerfile)

### 简单启动
````bash
docker run -ti -d -e TZ=Asia/Shanghai -p 25565:25565 --name mc -d bluerain/minecraft:tag
````
### 保存数据到宿主机系统
````bash
docker run -ti -d -e TZ=Asia/Shanghai -p 25565:25565 --name mc -d -v ${your_host_path}:/data/minecraft bluerain/minecraft:tag
````
例如
````bash
docker run -ti -d -e TZ=Asia/Shanghai -p 25565:25565 --name mc1.10 -d -v /data/mc1.9:/data/minecraft bluerain/minecraft:1.9
````
/data/mc1.9是我的主机系统上的目录，启动这个容易以后会看到这样的文件结构:
````
.
├── banned-ips.json
├── banned-players.json
├── eula.txt
├── logs
├── minecraft_server.jar
├── ops.json
├── server.properties
├── startup.sh
├── usercache.json
├── whitelist.json
└── world
````
可见这个也就是启动minecraft_server.jar的主目录，你想 要的/修改 的数据都在此。   

### 添加 JVM 参数
当然，根据服务器配置的不同，难免有需要调整 JVM 内存的时候。   
你只需要这么做，在 minecraft 主目录有一个 startup.sh 文件，在它的开头是这样的：
````bash
#!/usr/bin/env bash

JVM_OPTS='-Xmx1024m -Xms1024m'
# 省略后续内容...
````
重点就是这个 JVM_OPTS='arg01 arg02'，如果你想加 JVM 参数只需要填充或者修改它即可，默认的是 -Xmx1024m -Xms1024m 。加入我的服务器内存比较小的话，那么可以把初始内存和最大内存都调小一点:   
JVM_OPTS='-Xmx768m -Xms512m'    
有一些 MC 镜像是在启动容器的时候添加 JVM 参数，个人没有这样做，因为参数可能经常需要调整。

### 补充
上面几个镜像没有大不同，区别仅仅是拉取时候的 server 文件版本不一样。但是只要是指定版本镜像的容器，无论启动多少次都只会得到该版本的 server.jar .   
当然也可以做成一个镜像，给参数拉取不同的版本。不过直接拉取版本更加方便也基本不会多占用空间。Docker 的 tag 的作用也在于此。

### 作者的MC服
* mc110.bluerain.io (v1.10)
* mc17.bluerain.io:25567 (v1.7)
* mc群: 493545276 (QQ群)

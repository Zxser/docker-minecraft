Minecraft Server Images.
========================
## 包括的版本：
注：默认的 last 版本是1.10   
* 1.9.4 [(Dockerfile)](https://github.com/HentaiMew/docker-minecraft/blob/master/1.9/Dockerfile)
* 1.8.9 [(Dockerfile)](https://github.com/HentaiMew/docker-minecraft/blob/master/1.8/Dockerfile)
* 1.7.10 [(Dockerfile)](https://github.com/HentaiMew/docker-minecraft/blob/master/1.7/Dockerfile)

## 简单运行
````bash
docker run -ti -d -e TZ=Asia/Shanghai -p 25565:25565 --name mc -d bluerain/minecraft:tag
````
## 保存数据到宿主机
````bash
docker run -ti -d -e TZ=Asia/Shanghai -p 25565:25565 --name mc -d -v ${your_path}:/data/minecraft bluerain/minecraft:tag
````
例如
````bash
docker run -ti -d -e TZ=Asia/Shanghai -p 25565:25565 --name mc1.10 -d -v /data/mc1.9:/data/minecraft bluerain/minecraft:1.9
````
由上可知，容器中的 /data/minecraft 是主要存放目录。minecraft_server.jar 和其他数据文件都存放于此。   
第一次启动时，因为宿主机映射的 minecraft 目录不存在 server 文件，所以 -v 以后的容器，会在第一次启动时重新下载一遍。

## 补充
上面几个镜像没有上面大不同，区别仅仅是拉取时候的server文件版本不同而已，但是只要是指定版本镜像的容器，无论启动多少次都会拉取该版本的 server.jar   
当然也可以做成一个镜像，给参数拉取不同的版本。不过直接拉取版本更加方便也基本不会多占用空间。Docker的tag的作用也在于此。

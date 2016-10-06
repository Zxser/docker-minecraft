FROM java:8-jre
MAINTAINER bluerain me@bluerain.io
ENV STARTUP_SH /data/minecraft/startup.sh
ENV START /usr/local/bin/start-mc-server
ENV VERSION_ADDRESS https://launcher.mojang.com/mc/game/1.8.9/server/b58b2ceb36e01bcd8dbf49c8fb66c55a9f0676cd/server.jar

RUN curl -sL http://shell.bluerain.io/release/minecraft | bash -s ${VERSION_ADDRESS}
RUN cp $STARTUP_SH $START
RUN buildDeps='bzip2 unzip xz-utils' \
    && apt purge -y $buildDeps && rm -rf /var/lib/apt/lists/*

EXPOSE 25565:25565

CMD ${START}

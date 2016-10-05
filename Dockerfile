FROM java:8-jre
MAINTAINER bluerain me@bluerain.io
ENV STARTUP_SH /data/minecraft/startup.sh
ENV START /usr/local/bin/start-mc-server
RUN curl -sL http://shell.bluerain.io/minecraft | bash
RUN cp $STARTUP_SH $START
RUN buildDeps='bzip2 unzip xz-utils' \
    && apt purge -y $buildDeps && rm -rf /var/lib/apt/lists/*

EXPOSE 25565:25565

CMD ${START}


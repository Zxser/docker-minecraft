FROM java:8-jre
MAINTAINER bluerain me@bluerain.io
ENV STARTUP_SH /data/minecraft/startup.sh

RUN curl -sL http://shell.bluerain.io/minecraft | bash
RUN buildDeps='bzip2 unzip xz-utils curl wget' \
    && apt purge -y $buildDeps && rm -rf /var/lib/apt/lists/*

EXPOSE 25565:25565

CMD ${STARTUP_SH}


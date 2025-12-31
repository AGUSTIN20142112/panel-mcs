FROM node:18-bullseye

ENV MCSM_DAEMON_PORT=24444
ENV MCSM_WEB_PORT=23333

WORKDIR /opt/mcsmanager

RUN apt-get update && apt-get install -y \
    curl \
    openjdk-17-jre-headless \
    screen \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Instalador oficial de MCSManager
RUN curl -fsSL https://get.mcsmanager.com/install.sh | bash

EXPOSE 23333 24444

# El instalador crea start.sh que arranca el panel/daemon
CMD ["./start.sh"]

FROM node:18-bullseye

WORKDIR /opt/mcsmanager

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-17-jre-headless \
  screen \
  git \
  bash \
  && rm -rf /var/lib/apt/lists/*

# Instalar MCSManager
RUN curl -fsSL https://get.mcsmanager.com/install.sh | bash

EXPOSE 23333

# COMANDO REAL Y CORRECTO
CMD ["node", "/opt/mcsmanager/daemon/index.js"]

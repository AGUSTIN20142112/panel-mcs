FROM node:18-bullseye

# Variables de entorno
ENV MCSM_DAEMON_PORT=24444
ENV MCSM_WEB_PORT=23333

# Directorio de trabajo
WORKDIR /opt/mcsmanager

# Instalar dependencias básicas
RUN apt update && apt install -y \
    curl \
    openjdk-17-jre-headless \
    screen \
    git \
    && rm -rf /var/lib/apt/lists/*

# Descargar MCSManager
RUN curl -fsSL https://get.mcsmanager.com/install.sh | bash

# Exponer puertos
EXPOSE 23333
EXPOSE 24444

# Comando correcto (ESTO arregla el error "npm run production")
CMD ["./start.sh"]

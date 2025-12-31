FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache git bash

RUN git clone https://github.com/MCSManager/MCSManager.git .

RUN npm install

EXPOSE 23333

CMD ["npm", "run", "production"]

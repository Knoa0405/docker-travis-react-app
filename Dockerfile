FROM node:alpine

WORKDIR /home/ret

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build
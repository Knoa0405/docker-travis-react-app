FROM node:alpine

WORKDIR /home/ret

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=0 /home/ret/build /usr/share/nginx/html
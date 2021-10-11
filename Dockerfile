FROM node:alpine

RUN cd home \ && mkdir ret

RUN chmod -R 777 /home/ret

WORKDIR /home/ret

COPY package.json ./

RUN npm install

COPY ./ ./

RUN ["npm","run", "build"]

FROM nginx

EXPOSE 80

COPY --from=0 /home/ret/build /usr/share/nginx/html
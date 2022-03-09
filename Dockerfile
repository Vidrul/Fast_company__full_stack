FROM node:14 as client

WORKDIR /app/client


COPY Client/package.json /app/client

RUN npm install


FROM node:alpine

WORKDIR /app

COPY Server/package.json /app


RUN npm install


COPY Server /app


COPY --from=client /app/client/build /app/client/build


EXPOSE 8080


CMD ["npm", "start"]
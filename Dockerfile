FROM node:22.12-alpine
WORKDIR /app
COPY . .
RUN apk add --no-cache python3 g++ make
RUN yarn install --production
ENV API_URL=https://api.andreiacono.com/
CMD ["node", "src/index.js"]
EXPOSE 3000


#COMANDOS ESTUDO

#RUN addgroup dev && adduser -S -G david dev
#USER david

#docker run -dp 3000:3000 app -> Roda em background -d, e mapeia a porta 3000 do pc local para a porta 3000 do container
#docker image ls
#docker ps -> Lista containers
#docker build -t app . -> Cria a imagem com a tag app a partir do diretorio atual
#docker run -it app sh -> Roda a imagem de modo interativo e modo shell
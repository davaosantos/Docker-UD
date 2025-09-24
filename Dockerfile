FROM node:22.12-alpine
WORKDIR /app
COPY package.json .
RUN apk add --no-cache python3 g++ make
RUN yarn install --production
COPY . .
ENV API_URL=https://api.andreiacono.com/
CMD ["node", "src/index.js"]
EXPOSE 3000


#COMANDOS ESTUDO

#RUN addgroup dev && adduser -S -G david dev
#USER david


#->  S.2 -> Criando imagens docker

#docker run -dp 3000:3000 app -> Roda em background -d, e mapeia a porta 3000 do pc local para a porta 3000 do container
#docker image ls
#docker ps -> Lista containers
#docker build -t app . -> Cria a imagem com a tag app a partir do diretorio atual
#docker run -it app sh -> Roda a imagem de modo interativo e modo shell
#docker images
#docker build -t app:v1.0.0 . -> Criando tags para uma imagem
#docker image remove app:v1.0.0
#docker image rm app:v2 -> Remover uma imagem pelo nome e tag

#docker push davaosantos123/app:v2 -> Subir uma imagem para o docker hub, com o nome do repositorio/projeto e a versão
#docker image tag 1127de6cb91e davaosantos123/app:v2 -> Defino uma tag v2 para a imagem de ID 1127e...

#docker image save -o appv2.tar app:v2 -> salvar uma imagem em um arquivo, geralmente compactado
#docker image load -i appv2.tar -> Carregar imagem de um arquivo, geralmente .TAR


#S.5 -> Containers
#docker run -d --name manga davaosantos123/app:v2 -> Rodar container a partir de uma imagem, com um nome para o container
#tag -d -> Rodar em background
#docker prune, remove containers inativos, caso coloque images, remove imagens inativas
#docker logs -f 7b6822a6d2da -> Logs de um container id -> docker logs [OPTIONS] CONTAINER
#docker run -d -p 80:3000 --name teste davaosantos123/app:v1 -> -p para mapeamento de porta
#docker exec banana ls -> Exec roda comandos dentro do container, Banana -> Nome do container , -IT -> exec em modo interativo docker exec -it pera2 sh
#docker run -d -p:3000:3000 --name pera -v app-dados:/app/dados davaosantos123/app:v2 -> Rodando container com VOLUME associado(ATTACHED)
#docker start banana -> starta container já criado / docker run -> cria container/ docker stop banana -> stopa container ja criado
#docker cp david.txt pera2:/app  -> Origem e Destino, nesse caso, do host para o container


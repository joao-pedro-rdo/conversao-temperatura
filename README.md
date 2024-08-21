# Projeto conversão de temperatura

### Sobre o projeto

O projeto conversão de temperatura é um projeto desenvolvido em NodeJS. O projeto tem como objetivo ser um exemplo para a criação de ambiente com containers usando NodeJS.

### Observações do projeto

A aplicação é exposta usando a porta 8080

### Overveiw da imagem docker

- Você pode encontrar a imagem do projeto no Docker Hub através do link: [joaoprdo/conversao-temperatura](https://hub.docker.com/r/joaoprdo/conversao-temperatura) e o código fonte no [GitHub](https://github.com/joao-pedro-rdo/conversao-temperatura)

- Pode ser executada atraves do comando:

``` bash
docker container run -it -P --rm  joaoprdo/conversao-temperatura:latest
```

- se quiser fazer o bind de porta personalizado pode ser feito da seguinte forma:

``` bash
docker container run -it -p 8080:8080 --rm joaoprdo/conversao-temperatura:latest
```

- Caso deseje nomear o container deve ser passado o parametro `--name <nome>`

- `--rm` remove o container após a execução

### Dockerfile:

``` Dockerfile
FROM ubuntu:latest
RUN apt-get update
RUN apt install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs 
WORKDIR /app
COPY /src . 
RUN npm install 
EXPOSE 8080
ENTRYPOINT [ "node", "server.js"]

```

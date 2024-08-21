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

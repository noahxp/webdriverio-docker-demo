FROM ubuntu:22.04 as build

ENV NVM_DIR /opt/nvm
ENV NODE_VERSION v16.13.2
ENV APP_DIR /app


RUN [ -d $APP_DIR ] || mkdir -p $APP_DIR
RUN [ -d $NVM_DIR ] || mkdir -p $NVM_DIR

RUN apt-get update
RUN apt-get install curl -y

# install nvm & node.js
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh |bash
RUN curl -o $NVM_DIR/install.sh https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh
RUN /bin/bash $NVM_DIR/install.sh
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

# install application
COPY test /app/test
COPY *.js /app/
COPY *.json /app/
COPY --chmod=0755 *.sh /app/


WORKDIR $APP_DIR
RUN npm install


#####
# x86_64-chrome:  selenium/standalone-chrome:latest
# x86_64-firefox: selenium/standalone-firefox:latest
# arm64-chrome:  seleniarm/standalone-chromium:latest
# arm64-firefox: seleniarm/standalone-firefox:latest
#####
FROM seleniarm/standalone-chromium:latest

ENV TERM="xterm-color"
ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US.UTF-8'

ENV NVM_DIR /opt/nvm
ENV NODE_VERSION v16.13.2
ENV APP_DIR /app

RUN [ -d $APP_DIR ] || (sudo mkdir -p $APP_DIR && sudo chown `whoami`:`id -g -n` $APP_DIR)
RUN [ -d $NVM_DIR ] || (sudo mkdir -p $NVM_DIR && sudo chown `whoami`:`id -g -n` $NVM_DIR)

COPY --from=build $NVM_DIR/install.sh $NVM_DIR
RUN /bin/bash $NVM_DIR/install.sh

ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

COPY --chown=seluser:seluser --from=build $APP_DIR $APP_DIR

WORKDIR $APP_DIR


CMD [ "/app/entrypoint.sh" ]

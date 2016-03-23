FROM node:latest

MAINTAINER Benjamoin Garcia

RUN apt-get -q update
RUN apt-get -qy install git-core redis-server

RUN npm install -g yo generator-hubot coffee-script

RUN adduser --disabled-password --gecos "" yeoman; \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/yeoman
USER yeoman
WORKDIR /home/yeoman

RUN git clone https://github.com/benjamingarcia/johnny5.git johnny5
RUN cd johnny5; npm install

CMD cd johnny5; bin/hubot --adapter slack

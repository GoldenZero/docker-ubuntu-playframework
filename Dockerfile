# Ubuntu 14.04 LTS
# Oracle Java 1.8.0_11 64 bit
# git 1.9.1
# Nano 2.2.6-1ubuntu1

# extend the most recent long term support Ubuntu version
FROM ubuntu:14.04

MAINTAINER Muayad Sayed ALi (moayds1@gmail.com)

# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive

# update dpkg repositories
RUN apt-get update 

# install 
RUN apt-get install -y wget git nano nginx curl zip

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update

# auto accept oracle jdk license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer ca-certificates

# configure the container to run nginx, mapping container port 80 to that host port
ENTRYPOINT ["java"]
EXPOSE 80

CMD [""]
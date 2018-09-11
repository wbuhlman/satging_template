# Not for Production. Demo Only
FROM google/cloud-sdk:latest

MAINTAINER @mateuswagner 

USER root

ENV DEBIAN_FRONTEND noninteractive

ENV TERM linux

# Install required packages
RUN apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y clean && apt-get install -y --no-install-recommends \
    software-properties-common \
    python2.7 \
    python2.7-dev \
    python-qt4 \
    python-pyside \
    python-pip \
    python3-pip \
    python3-pyqt5 \
    python-virtualenv \
    ca-certificates \
    musl-dev \
    gcc \
    python-dev \
    make \
    cmake \
    g++ \
    libpng-dev \ 
    libxml2-dev \
    libxslt-dev \
    git \
    vim \
    bzip2 \
    unzip \
    xz-utils \
    alien \
    libaio1 \
    sudo \
    nfs-common 
	
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENV LANG=C.UTF-8

# StackDriver agent requires service-account 
#RUN curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
#RUN bash install-logging-agent.sh

#COPY oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
#RUN alien -i oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

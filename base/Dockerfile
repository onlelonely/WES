FROM centos:latest

MAINTAINER Li Hsin Chang <cc1296@ym.edu.tw>

# OPEN JDK/JRE

RUN yum update -y
RUN yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel \
       perl \
       unzip \
       bzip2 \
       make \
       gcc 

RUN yum install -y zlib-devel
RUN yum install -y \ 
       ncurses-devel \
       bzip2-devel \
       xz-devel.x86_64 \
       libcurl-devel \
       openssl-devel \
       python-dev \
       python-pip \
       tzdata 

RUN yum install -y wget


RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc





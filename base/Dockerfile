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
       openssl-devel



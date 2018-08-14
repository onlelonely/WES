FROM onlelonely/base:latest

MAINTAINER Li Hsin Chang <cc1296@ym.edu.tw>

#samtools

RUN yum -y install epel-release \
    yum -y install wget dpkg 
	
RUN wget -O /tmp/samtools-1.9.tar.bz2  https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 \
    && mkdir /usr/local/samtools/ \
    && tar xjvf /tmp/samtools-1.9.tar.bz2  -C /usr/local/samtools/ \
    && chmod -R 777 /usr/local/samtools \
    && cd /usr/local/samtools/samtools-1.9 \
    && ./configure --prefix=/usr/local/samtools/ \
    && make \
    && make install

RUN yum -y remove wget dpkg; \
    yum clean all

ARG UID

RUN useradd -u $UID ihlee

USER ihlee

ENTRYPOINT ["/usr/local/samtools/bin/samtools"]





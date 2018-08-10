FROM base:latest

MAINTAINER Li Hsin Chang <cc1296@ym.edu.tw>

#BWA

RUN yum -y install epel-release \
    yum -y install wget dpkg 
	
RUN wget -O /tmp/bwa-0.7.12.tar.bz2 http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2 \
    && mkdir /usr/local/bwa/ \
    && tar xjvf /tmp/bwa-0.7.12.tar.bz2 -C /usr/local/bwa/ \
    && chmod -R 777 /usr/local/bwa \
    && cd /usr/local/bwa/bwa-0.7.12 && make \
    && cp -v /usr/local/bwa/bwa-0.7.12/bwa /usr/local/bin

RUN yum -y remove wget dpkg; \
    yum clean all

ARG UID

RUN useradd -u $UID ihlee

USER ihlee
ENTRYPOINT ["/usr/local/bin/bwa"]





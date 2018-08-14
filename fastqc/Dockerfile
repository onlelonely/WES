FROM onlelonely/base:latest

MAINTAINER Li Hsin Chang <cc1296@ym.edu.tw>

#FastQC

ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip /tmp/ 

RUN cd /usr/local && \
    unzip /tmp/fastqc_*.zip && \
    chmod 755 /usr/local/FastQC/fastqc && \
    ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc && \
    rm -rf /tmp/fastqc_*.zip

ARG UID

RUN useradd -u $UID ihlee

USER ihlee
ENTRYPOINT ["usr/local/bin/fastqc"]






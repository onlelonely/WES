FROM base:latest

MAINTAINER Li Hsin Chang <cc1296@ym.edu.tw>

#BWA

RUN yum -y install epel-release 
	
RUN wget -O /tmp/bwa-0.7.12.tar.bz2 http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2 \
    && mkdir /usr/local/bwa/ \
    && tar xjvf /tmp/bwa-0.7.12.tar.bz2 -C /usr/local/bwa/ \
    && chmod -R 777 /usr/local/bwa \
    && cd /usr/local/bwa/bwa-0.7.12 && make \
    && cp -v /usr/local/bwa/bwa-0.7.12/bwa /usr/local/bin

	
RUN wget -O /tmp/samtools-1.9.tar.bz2  https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 \
    && mkdir /usr/local/samtools/ \
    && tar xjvf /tmp/samtools-1.9.tar.bz2  -C /usr/local/samtools/ \
    && chmod -R 777 /usr/local/samtools \
    && cd /usr/local/samtools/samtools-1.9 \
    && ./configure --prefix=/usr/local/samtools/ \
    && make \
    && make install

RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc

RUN yum -y remove wget dpkg; \
    yum clean all

ARG UID

RUN useradd -u $UID ihlee

COPY pipe.py /usr/local/bin/pipe.py
RUN chmod +x /usr/local/bin/pipe.py
RUN ln -s /usr/local/bin/pipe.py /usr/local/bin/pipe

USER ihlee
CMD ["/usr/local/bin/pipe"]










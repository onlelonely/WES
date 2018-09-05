FROM onlelonely/base:latest

MAINTAINER Li Hsin Chang <cc1296@ym.edu.tw>

COPY annovar.latest.tar.gz /tmp/annovar.latest.tar.gz

#ANNOVAR

RUN set -e \
      && tar xvf /tmp/annovar.latest.tar.gz -C /usr/local --remove-files \
      && find /usr/local/annovar -type f -maxdepth 1 -executable | xargs -i ln -s {} /usr/local/bin

ENTRYPOINT ["/usr/bin/perl", "/usr/local/annovar/table_annovar.pl"]





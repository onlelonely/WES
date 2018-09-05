WES pipeline & analysis tools
==================================

**Maintainer:** Li Hsin Chang
**Contact:** cc1296@ym.edu.tw

VGHTPE Ihlee lab dockerized WES pipeline backup

## Automated script
You can use my python script to build up the whole envrionment though the script may not work on your workstation.
The script will set up docker, docker-compose and asking whether download GATK resource bundle and ANNOVAR references or not.
Download these DBs will be a long proccess and I did not write an auto reconnect mechanism so I suggest you can download GATK resource buldle via filezella or other FTP clients.

Requirement:
Python3 & distro module

```bash
git clone https://github.com/onlelonely/WES.git
cd WES
python install.py
```

or you can dou it manually
## Getting started
First of all, you need to install Docker & docker compose.

Full instructions at https://docs.docker.com/.

For CentOS
```bash
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce
sudo yum -y install epel-release 
sudo yum -y install python-pip  
sudo pip install docker-compose 
sudo yum -y upgrade python* 
```
For Ubuntu
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
```
In order to use docker as non-root user, you need to do the following:
```bash
sudo addgroup docker
sudo usermod -aG docker $USER
```
To verify the installation, you can 
```bash
docker run --rm hello-world
```
and you'll get
>Hello from Docker!
>This message shows that your installation appears to be working correctly.
>
>To generate this message, Docker took the following steps:
> 1. The Docker client contacted the Docker daemon.
> 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
>    (amd64)
> 3. The Docker daemon created a new container from that image which runs the
>    executable that produces the output you are currently reading.
> 4. The Docker daemon streamed that output to the Docker client, which sent it
>    to your terminal.
>
>To try something more ambitious, you can run an Ubuntu container with:
> $ docker run -it ubuntu bash
>
>Share images, automate workflows, and more with a free Docker ID:
> https://hub.docker.com/
>
>For more examples and ideas, visit:
> https://docs.docker.com/engine/userguide/

***
## Set up reference DBs & build docker images

You can download GATK resource bundle via FTP client.
```
HOST:ftp.broadinstitute.org
USER:gsapubftp-anonymous
PASSWORD:
```
And you can download ANNOVAR references via annotate_variation.pl
```bash
perl annotate_variation.pl -buildver {hg version} -downdb -webfrom annovar {db name} {path}
```
For example, the DBs I use are hg38 version and store in ref/humandb folder
```
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar refgene ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar ensGene ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar phastConsElements46way ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar genomicSuperDups ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar 1000g2015aug ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar avsnp150 ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar dbnsfp33a ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad_genome ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad_exome ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar clinvar_20180603 ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar cadd13gt10 ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar dbscsnv11 ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar intervar_20180118 ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar esp6500siv2_all ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar exac03 ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar mcap ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar revel ref/humandb
perl annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gerp++elem ref/humandb
```



WES pipeline & analysis tools
==================================

**Maintainer:** Li Hsin Chang
**Contact:** cc1296@ym.edu.tw

VGHTPE Ihlee lab dockerized WES pipeline 

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

annovar you should download annovar.latest.tar.gz and build youreslf

- [fastqc](https://hub.docker.com/r/onlelonely/fastqc/)
- [bwa](https://hub.docker.com/r/onlelonely/bwa/)
- [Samtools](https://hub.docker.com/r/onlelonely/samtools/)
- [bwa & samtools & Anconda for pipeline](https://hub.docker.com/r/onlelonely/tools/)

Command examples:
To open FastQC GUI
	docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v YourDATA -it fastqc
Directly use command line
	docker run -v DATAPATH:/DATA -it fastqc /DATA/YourBAM

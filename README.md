# WES

VGHTPE Ihlee lab dockerized WES pipeline 


- [fastqc](https://hub.docker.com/r/onlelonely/fastqc/)
- [ANNOVAR](https://hub.docker.com/r/onlelonely/annovar/)
- [bwa](https://hub.docker.com/r/onlelonely/bwa/)
- [Samtools](https://hub.docker.com/r/onlelonely/samtools/)
- [bwa & samtools & Anconda for pipeline](https://hub.docker.com/r/onlelonely/tools/)

Command examples:
To open FastQC GUI
	docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v YourDATA -it fastqc
Directly use command line
	docker run -v DATAPATH:/DATA -it fastqc /DATA/YourBAM

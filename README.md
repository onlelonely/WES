# WES

VGHTPE Ihlee lab dockerized WES pipeline testing 


- [fastqc](https://hub.docker.com/r/onlelonely/fastqc/)

Command examples:
To open FastQC GUI
	docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v YourDATA -it fastqc
Directly use command line
	docker run -v DATAPATH:/DATA -it fastqc /DATA/YourBAM

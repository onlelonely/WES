#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug 22 05:05:44 2018

@author: Li Hsin Chang
"""

import stat
import distro
import socket
import os
import time
import subprocess
from ftplib import FTP
destination = "ref"
dbs=["refgene","ensGene","phastConsElements46way","genomicSuperDups","1000g2015aug","avsnp147","dbnsfp33a","gnomad_genome","gnomad_exome","clinvar_20180603","cadd13gt10","dbscsnv11","intervar_20180118","esp6500siv2_all","exac03","mcap","revel","gerp++elem"]

def gatk_download(destination,version):
    ftp = FTP("ftp.broadinstitute.org")
    ftp.login("gsapubftp-anonymous")
    ftp.sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
    ftp.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPINTVL, 75)
    ftp.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPIDLE, 60)     
    ftp.set_pasv(True)
    ftp.cwd("bundle/hg"+version)
    filelist=ftp.mlsd()
    for file in filelist:
        time.sleep(0.5)
        if file[1]['type']=='file':
            ftp.retrbinary("RETR " + file[0], open(os.path.join(destination, file[0]),"wb").write)
        else:
            pass
    return


outfile=open("install.sh","w")

outfile.write("#!/bin/bash\n\n")

if(distro.linux_distribution(full_distribution_name=False)[0]) =="centos":
    outfile.write("sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo\nsudo yum install docker-ce\nsudo yum -y install epel-release\nsudo yum -y install python-pip\nsudo pip install docker-compose\nsudo yum -y upgrade python*\n")
elif(distro.linux_distribution(full_distribution_name=False)[0]) =="ubuntu":
    outfile.write("curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -\nsudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"\nsudo apt-get update\nsudo apt-get install -y docker-ce")     

outfile.write("source env.sh; rm -rf docker-compose.yml; envsubst < \"template.yml\" > \"docker-compose.yml\";\n")
outfile.write("docker-compose up\ndocker rm $(docker ps -a -q)\n")

while True:
    temp=(input("Do yo need to set up Reference DBs for annovar?[Y/n]") or "y")
    if (temp=="y" or temp=="Y"):
        if os.path.exists(os.path.join(destination+"/humandb")):
            pass
        else:
            os.mkdir(os.path.join(destination+"/humandb"))
        temp=(input("hg [38] or 19?") or "38")
        for db in dbs:
            outfile.write("perl annotate_variation.pl -buildver hg{version} -downdb -webfrom annovar {db} {path}\n".format(version=str(temp),db=db,path=os.path.join(destination+"/humandb")))
        break
    elif (temp=="n" or temp=="N"):
        break
    else:
        print("Sorry, not a valid input")
        continue
    
outfile.close()
os.chmod("install.sh", stat.S_IRWXU)

while True:
    temp=(input("Do yo need to download GATK resource bundle?[Y/n]") or "y")
    if (temp=="y" or temp=="Y"):
        if os.path.exists(destination):
            pass
        else:
            os.mkdir(destination)
        temp=(input("hg [38] or 19?") or "38")
        gatk_download(destination,temp)
        break
    elif (temp=="n" or temp=="N"):
        break
    else:
        print("Sorry, not a valid input")
        continue

subprocess.call("./install.sh")


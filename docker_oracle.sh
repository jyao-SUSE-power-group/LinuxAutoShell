#!/usr/bin/env bash



# usage ：
#usage ：  curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/docker_oracle.sh | bash

#作者：jyaoSUSE



sudo mkdir -p /etc/docker
sudo sh -c ' cat << EOF >> /etc/docker/daemon.json
{
  "registry-mirrors": ["https://0e3kttqp.mirror.aliyuncs.com"]
}
EOF'


sudo systemctl daemon-reload
sudo systemctl restart docker

docker run -d --name=oracle2  --restart=always  -e TZ="Asia/Shanghai" -v /etc/localtime:/etc/localtime:ro  -p 1522:1521 -p 5501:8080  -e IMPORT_FROM_VOLUME=true -v /my/oracle/data:/u01/app/oracle  sath89/oracle-12c


#Connect database with following setting:

# hostname: localhost
# port: 1521
# sid: xe
# service name: xe
# username: system
# password: oracle

#oracle
#Connect to Oracle Application Express web management console with following settings:
#
#http://localhost:8080/apex
#workspace: INTERNAL
#user: ADMIN
#password: 0Racle$
#Apex upgrade up to v 5.*
#
#Connect to Oracle Enterprise Management console with following settings:
#
#http://localhost:8080/em
#user: sys
#password: oracle
#connect as sysdba: true
#By Default web management console is enabled. To disable add env variable:



echo << EOF

#Connect database with following setting:

# hostname: localhost
# port: 1521
# sid: xe
# service name: xe
# username: system
# password: oracle

#oracle
#Connect to Oracle Application Express web management console with following settings:
#
#http://localhost:8080/apex
#workspace: INTERNAL
#user: ADMIN
#password: 0Racle$
#Apex upgrade up to v 5.*
#
#Connect to Oracle Enterprise Management console with following settings:
#
#http://localhost:8080/em
#user: sys
#password: oracle
#connect as sysdba: true
#By Default web management console is enabled. To disable add env variable:

EOF





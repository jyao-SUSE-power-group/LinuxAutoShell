#!/usr/bin/env bash



# usage ：
#usage ：  curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/docker_mysql.sh | bash

#作者：jyaoSUSE



sudo mkdir -p /etc/docker
sudo sh -c ' cat << EOF >> /etc/docker/daemon.json
{
  "registry-mirrors": ["https://0e3kttqp.mirror.aliyuncs.com"]
}
EOF'


sudo systemctl daemon-reload
sudo systemctl restart docker

sudo mkdir -p /etc/docker_mysql/conf
sudo mkdir -p /etc/docker_mysql/data
sudo sh -c ' curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/my.cnf > /etc/docker_mysql/conf/my.cnf '

sudo docker run --name my2  -e TZ="Asia/Shanghai" -v /etc/localtime:/etc/localtime:ro --restart=always -d -p 43307:3306 -v /etc/docker_mysql/data:/var/lib/mysql -v /etc/docker_mysql/conf/my.cnf:/etc/mysql/conf.d/my_custom.cnf  -e MYSQL_ROOT_PASSWORD=root@f/a-18  mysql

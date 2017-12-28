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

sudo mkdir -p /etc/docker_mysql
sudo sh -c ' curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/my.cnf > /etc/docker_mysql/my.cnf '

sudo docker run --name mymysql --restart=always -d -p 3306:3306 -v /etc/docker_mysql/my.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf  -e MYSQL_ROOT_PASSWORD=root  mysql

#!/usr/bin/env bash
# usage ： curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/docker _mysql.sh | bash


sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["https://0e3kttqp.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

sudo mkdir -p /etc/docker_mysql
curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/my.cnf > /etc/docker_mysql/my.cnf

docker run --name mymysql --restart=always -d -p 3306:3306 -v /etc/docker_mysql/my.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf -v /etc/docker_mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root  mysql

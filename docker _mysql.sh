
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://0e3kttqp.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker


docker run -d -p 3306:3306 -v /soft/mysql/my.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf -v /soft/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mymysql mysql

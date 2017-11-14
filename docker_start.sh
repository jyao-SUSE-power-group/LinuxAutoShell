#!/usr/bin/env bash

# --link=
# --volumes-from=
# -h=


docker rm -f ctj2
docker run -d --name=ctj2 -h=master --restart=always -e "container=docker" --privileged=true   -v /sys/fs/cgroup:/sys/fs/cgroup   centos /usr/sbin/init


docker run -d --name=ctj3 -h=slave --link=ctj2:kube-master --restart=always -e "container=docker" --privileged=true   -v /sys/fs/cgroup:/sys/fs/cgroup   centos /usr/sbin/init




for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker etcd ; do systemctl stop $SERVICES ; done ;
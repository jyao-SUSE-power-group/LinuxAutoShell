#!/usr/bin/env bash

# --link=
# --volumes-from=
# -h=


docker rm -f ctj2
docker run -d --name=ctj2 -h=master --restart=always -e "container=docker" --privileged=true   -v /sys/fs/cgroup:/sys/fs/cgroup   centos /usr/sbin/init


docker run -d --name=ctj3 -h=slave --link=ctj2:kube-master --restart=always -e "container=docker" --privileged=true   -v /sys/fs/cgroup:/sys/fs/cgroup   centos /usr/sbin/init
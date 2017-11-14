#!/usr/bin/env bash
docker run -d --name=ctj2 --restart=always -e "container=docker"  --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro  centos /usr/sbin/init

#!/usr/bin/env bash


# usage ： 
#        curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/centos_kubernetes.sh | bash
#作者：jyaoSUSE
#链接：https://juejin.im/post/5a0952f25188257bf5334952
#来源：掘金
#著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

yum install -y epel-release ;
sed -e 's!^mirrorlist=!#mirrorlist=!g' -e 's!^#baseurl=!baseurl=!g'   -e 's!//download\.fedoraproject\.org/pub!//mirrors.ustc.edu.cn!g'  -e 's!http://mirrors\.ustc!https://mirrors.ustc!g'  -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo ;

curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/kubernetes_repo > /etc/yum.repos.d/virt7-docker-common-release.repo ;

yum makecache ;
yum update -y;



sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Step 2: 添加软件源信息
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# Step 3: 更新并安装 Docker-CE
sudo yum makecache fast
sudo yum -y install docker-ce
# Step 4: 开启Docker服务
sudo service docker start

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://0e3kttqp.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker



yum install  htop net-tools  htop vim e4fsprogs iptables  openssh-server   byobu git zsh  -y ;

yum -y install --enablerepo=virt7-docker-common-release kubernetes etcd flannel
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;

sleep 1;
for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker   ; do  echo $SERVICES ; done ;



sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;

for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker etcd ; do systemctl restart $SERVICES ; systemctl enable  $SERVICES ; systemctl status $SERVICES ; systemctl start $SERVICES ; done ;

echo "sleep 2 s ,wait service loading!"
sleep 2;







## test kubectl
kubectl get nodes ;


#!/usr/bin/env bash


# usage ： 
#        curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/centos_kubernetes.sh | sh
#作者：jyaoSUSE
#链接：https://juejin.im/post/5a0952f25188257bf5334952
#来源：掘金
#著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

yum install -y epel-release ;
sed -e 's!^mirrorlist=!#mirrorlist=!g' -e 's!^#baseurl=!baseurl=!g'   -e 's!//download\.fedoraproject\.org/pub!//mirrors.ustc.edu.cn!g'  -e 's!http://mirrors\.ustc!https://mirrors.ustc!g'  -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo ;
yum makecache ;
yum update -y;
yum install htop net-tools etcd htop vim e4fsprogs iptables kubernetes openssh-server   byobu git zsh -y ;

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;


for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker   ; do  echo $SERVICES ; done ;

for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker etcd ; do systemctl restart $SERVICES ; systemctl enable  $SERVICES ; systemctl status $SERVICES ; done ;



sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;


## test kubectl
kubectl get nodes ;


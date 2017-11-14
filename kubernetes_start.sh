#!/usr/bin/env bash


# usage ： 
sleep 1;
for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker   ; do  echo $SERVICES ; done ;



sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;

for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker etcd ; do systemctl restart $SERVICES ; systemctl enable  $SERVICES ; systemctl status $SERVICES ; systemctl start $SERVICES ; done ;

echo "sleep 2 s ,wait service loading!"
sleep 2;




## test kubectl
kubectl get nodes ;


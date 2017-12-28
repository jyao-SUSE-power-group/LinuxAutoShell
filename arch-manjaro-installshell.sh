#!/usr/bin/env bash


# usage ： 
#        curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/arch-manjaro-installshell.sh | bash
#作者：jyaoSUSE

echo "`whoami` ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo " alias sc='~/.zshrc' " >> /etc/sudoers

sudo su 

pacman-mirrors  -c China -b unstable 

rm -fr /var/lib/pacman/db.lck

pacman -S  --noconfirm vim 

pacman -Syu --noconfirm htop net-tools htop   openssh-server byobu git zsh 

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;

git config --global user.email "jackyao713911@gmail.com" 
git config --global user.name "jyao"

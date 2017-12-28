#!/usr/bin/env bash


# usage ： 
#        curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/arch-manjaro-installshell.sh | bash
#作者：jyaoSUSE

sudo sh -c ' echo "`whoami` ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers '

echo " alias sc=' source ~/.zshrc' " >> /~/.zshrc



sudo pacman-mirrors  -c China -b unstable 

sudo rm -fr /var/lib/pacman/db.lck

sudo pacman -S  --noconfirm vim 

sudo pacman -Syu --noconfirm htop net-tools htop yaourt  openssh-server byobu git zsh 

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;

git config --global user.email "jackyao713911@gmail.com" 
git config --global user.name "jyao"



sudo sh -c 'curl https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/pacman.conf > /etc/pacman.conf'

#!/usr/bin/env bash



sudo pacman kcm-fcitx fcitx-sogoupinyin

cp ~/.xprofile ~/.xprofile.bak

cat << EOF >>  ~/.xprofile

export GTK_IM_MODULE=fcitx

export QT_IM_MODULE=fcitx

export XMODIFIERS="@im=fcitx"

EOF
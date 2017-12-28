#!/usr/bin/env bash



sudo pacman kcm-fcitx fcitx-sogoupinyin fcitx-qt4 fcitx-qt5

cp ~/.xprofile ~/.xprofile.bak

cat << EOF >>  ~/.xprofile

export GTK_IM_MODULE=fcitx

export QT_IM_MODULE=fcitx

export XMODIFIERS="@im=fcitx"

EOF





# 追加
# cat > test.sh << EOF 内容  EOF
#!/usr/bin/env bash

rootdir_used=$(echo "$1" | sudo -S du -hsx / | cut -f 1)
tmp_used=$(echo "$1" | sudo -S du -hsx /tmp | cut -f 1)
var_used=$(echo "$1" | sudo -S du -hsx /var | cut -f 1)
usr_used=$(echo "$1" | sudo -S du -hsx /usr | cut -f 1)
opt_used=$(echo "$1" | sudo -S du -hsx /opt | cut -f 1)
home_used=$(echo "$1" | sudo -S du -hsx /home | cut -f 1)

rootdir_avail=$(df -h --output=avail / | tr "\n" "\t" | cut -f 2 | cut -d " " -f 3)
tmp_avail=$(df -h --output=avail /tmp | tr "\n" "\t" | cut -f 2 | cut -d " " -f 3)
var_avail=$(df -h --output=avail /var | tr "\n" "\t" | cut -f 2 | cut -d " " -f 3)
usr_avail=$(df -h --output=avail /usr | tr "\n" "\t" | cut -f 2 | cut -d " " -f 3)
opt_avail=$(df -h --output=avail /opt | tr "\n" "\t" | cut -f 2 | cut -d " " -f 3)
home_avail=$(df -h --output=avail /home | tr "\n" "\t" | cut -f 2 | cut -d " " -f 3)


echo -e "Used Available Directory\n\
${rootdir_used} ${rootdir_avail} /\n\
${tmp_used} ${tmp_avail} /tmp\n\
${var_used} ${var_avail} /var\n\
${usr_used} ${usr_avail} /usr\n\
${opt_used} ${opt_avail} /opt\n\
${home_used} ${home_avail} /home" | sed 's/,/./g'
#!/bin/bash
# This script is used to install kcptun and it's daemon service.

PWD=$(pwd)

if [ "$EUID" -ne 0 ]; then 
	echo 'Please run this script as root'
	exit -1
fi

init=$(ps --no-headers -o comm 1)
if [ "$init" != "systemd" ]; then
	echo 'Your system does not suport systemd'
	exit -1
fi

echo 'Copying daemon service...'
cp $PWD/kcptun.service /etc/systemd/system/
if [ $? -ne 0 ]; then
	echo 'Failed to copy'
	exit -1
fi
echo 'Copying success'

echo 'Copying config file...'
if [ ! -d "/etc/kcptun" ]; then
	mkdir /etc/kcptun
fi
cp $PWD/config.json /etc/kcptun/
if [ $? -ne 0 ]; then
	echo 'Failed to copy'
	exit -1
fi
echo 'Copying success'

echo 'kcptun daemon install success, please download kcptun program
from https://github.com/shadowsocks/kcptun/releases/latest,
uncompress it and move the server to /usr/bin, then rename it
to kcp-server, and reboot system to take effect. If you want
to learn more config options please refer to
https://github.com/shadowsocks/kcptun#usage.'

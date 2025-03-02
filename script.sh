#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo  -e "\033[31m This script must be run with sudo \033[0m"
  exit 1
fi

echo -e "\033[32m installing genymotion \033[0m"
wget https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin
chomd +x ./genymotion-3.8.0-linux_x64.bin 
sudo ./genymotion-3.8.0-linux_x64.bin  -y



echo -e "\033[32m installing frida tools \033[0m"
sudo apt update -y -qq
sudo apt install pipx  -qq
sudo pipx install frida-tools -qq
frida-trace --version  # check if frida is installed


echo -e "\033[32m installing adb \033[0m"
sudo apt install android-tools-adb android-tools-fastboot -y -qq

echo -e "\033[32m installing burpsuite \033[0m"
sudo apt install burpsuite -y  
burpsuite

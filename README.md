# Seeting Up Android bug bounty lab
This guide provides step-by-step instructions to set up an Android lab for bug bounty hunting and security testing. It includes setting up an emulator, configuring proxies, installing necessary tools, and securing a testing environment.


## getting started

installing **adb**
```bash
     sudo apt install adb
```
install apktool
```bash
    sudo apt install apktool
```

install jadx
```
    sudo apt install default-jdk
    sudo apt install jadx
```
install frida tools
```bash
    sudo apt install pipx
    pipx install frida-tools
```

install objection
```bash
    pipx install objection
```

install mobSF
```
    sudo apt install docker.io
    sudo docker pull opensecurity/mobile-security-framework-mobsf
    sudo docker run -it --rm -p 8000:8000 opensecurity/mobile-security-framework-mobsf:latest  # to run the container
```

setting up genymotion emulator
```bash
wget https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin
chmod +x ./genymotion-3.8.0-linux_x64.bin 
sudo ./genymotion-3.8.0-linux_x64.bin  -y
```


install burpsuite
```bash
    sudo apt install burpsuite -y
```


## configuring our environment
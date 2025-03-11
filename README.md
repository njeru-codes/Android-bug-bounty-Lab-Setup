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
    pipx install frida-tools frida
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
1. open **genymotion** and install an emulator preferred `google pixel XL` . make sure to use android versions 11 and below since the images come pre-rooted
2.  Open burp suite and go to `proxy` then `proxy settings` tab and click on “Add” under the Proxy Listeners section.<br/>
you will add a listening interface

3. Add `Android Device Proxy Configuration`.To do this ---> On your Android emulator, open the Wi-Fi settings and long-press the connected Wi-Fi name. Select the “Modify Network” option. Under the Proxy settings, choose “Manual” and enter the IP address of your Kali machine.
4. Install Burp Certificate in android emulator: <br/>
Open any browser on your Android device and browse to http://burp, Click on the CA Certificate to download it into the Downloads folder. <br/>
Modify the Certificate Extension:<br/>
Change the file extension from .der to .cer. Then, navigate to the mobile settings, search for “Install Certificate,” and proceed accordingly.

The lab has been fully setup now<br/>
`Remember`: to install gApps on genymotion emulator to use google playstore

## bypassing certificate(SSL) pinning
check if youre a root user . The command should return `root`
```bash
    adb shell whoami
```
use objection to bypass SSL pinning.
Start Objection with the target app:
```bash
    objection -g com.target.app explore
    # replace com.target.app with your app
```
Disable SSL pinning:
```bash
    android sslpinning disable
```

2. using frida (Option 2) <br/>
Install Frida on your Genymotion emulator:<br/>
    - Download the Frida server:
    ```bash
        wget https://github.com/frida/frida/releases/download/16.1.0/frida-server-16.1.0-android-x86_64.xz

    ```
    - Extract and push it to the emulator:
    ```bash
        unxz frida-server-16.1.0-android-x86_64.xz
        adb push frida-server-16.1.0-android-x86_64 /data/local/tmp/
        adb shell chmod +x /data/local/tmp/frida-server-16.1.0-android-x86_64

    ```
    - run frida
    ```
        adb shell /data/local/tmp/frida-server-16.1.0-android-x86_64
    ```
    - Attach Frida to the target app and disable SSL pinning:
    ```
        frida -U -n com.target.app -s https://raw.githubusercontent.com/httptoolkit/frida-android-unpinning/main/frida-script.js
        # replace com.target.app  with your app

    ```


## other tools you can intall
- Ghidra: A software reverse engineering (SRE) suite of tools developed by NSA’s Research Directorate in support of the Cybersecurity mission.
- Drozer: drozer is the leading security testing framework for Android.
- Dex2jar: Converts .dex files to .class files, zipped as a jar file.
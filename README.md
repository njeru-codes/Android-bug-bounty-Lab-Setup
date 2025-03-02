# Android Bug Bounty Lab Setup

This repository provides a complete setup guide for an Android Bug Bounty testing lab environment. It is intended for security researchers and penetration testers who want to practice Android application security testing in a controlled environment.


## usage
clone the repo
```bash
    git clone https://github.com/njeru-codes/Android-bug-bounty-Lab-Setup.git
    cd Android-bug-bounty-Lab-Setup
```

run the installer script
```bash
    chmod +x ./script.sh
    sudo ./script.sh
```

start the emulator(genymotion)
- click its icon launcher on menu

check if emulator is running
```bash
    adb devices
```

frida server setup
```bash
wget https://github.com/frida/frida/releases/download/16.6.5/frida-server-16.6.5-android-x86.xz
xz -d frida-server-16.6.5-android-x86.xz
adb push frida-server-16.6.5-android-x86 /data/local/tmp/
adb shell chmod 777 /data/local/tmp/frida-server-16.6.5-android-x86
adb shell /data/local/tmp/frida-server-16.6.5-android-x86 &
adb shell ps | grep frida

```

launch burp to intercept requests & download certficates(in DER format)
push the cert to device
```bash
    burpsuite
    adb push ~/Downloads/ca-cert.der  /data/local/tmp/cert-der.crt
```

certifcate pinning bypass
```bash
    # wget https://github.com/54523464-a3d4-481f-bb25-6432b89c6547
    # the script is in this repo
    adb push fridascript.js  /data/local/tmp
```

run frida server
```bash
adb shell /data/local/tmp/frida-server-16.6.5-android-x86 &
adb shell ps | grep frida
frida-ps -U
```

from the command `frida-ps -U` locate the app target package name
```bash
    frida -U -f com.itstechrewards.watchandearntompesa  -l fridascript.js 
```


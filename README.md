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
```bash
    burpsuite
    adb push ~/Downloads/ca-cert.der  /data/local/tmp/cert-dert.crt
```


```bash
frida --codeshare pcipolloni/universal-android-ssl-pinning-bypass-with-frida -f YOUR_BINARY
```
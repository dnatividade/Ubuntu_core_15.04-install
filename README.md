# Ubuntu_core_15.04-install
#### Package Installation Procedures on Ubuntu Core 15.04 and Gumstix Overo Platform (armhf)

---

- First of all, download Ubuntu core 15.04 and clone it on a memory card.
```
$ wget http://gumstix-snappy.s3.amazonaws.com/overo.img.xz
$ xz -d overo.img.xz
$ sudo dd if=overo.img of=/dev/sdX bs=4k status=progress
#(sdbX is your memory card device)
```
(source: https://lists.ubuntu.com/archives/snappy-devel/2015-April/000525.html)


- If links above is broken, download from:
```
https://mega.nz/#!bOwniSyY!ozUl1McXS53jhYXr-BEwtSkc4uYdCZth1BeOKsVOc10
```

- Remove memory card from local computer and put on Gumstix.
- Power on Gumstix and system will boot from memory card.

CAUTION
---
- - During boot, the screen stay empty (black). No beep and no image is shown on the screen. This time is about **1m30s**.
- - Ubuntu core has no graphical interface, just command line.
- - USB keybord doesn't work if directly connected on USB port. **You need to use a USB HUB for any USB device to work**, as shown in the image below.




---
### draft...

- Log on Ubuntu with default credentials, change password and get IP address:
```
user: ubuntu
pass: ubuntu
```

```
$ passwd
NEW_PASSWORD
```
- Remount file system as RW, as follows:
```
$ sudo mount / -o remount,rw
```
- To supress the warning message: `sudo: unable to resolve host overo`, insert `overo 127.0.0.1` into /etc/hosts file, as follows:
```
$ sudo echo "overo 127.0.0.1" >> /etc/hosts
```

```
$ ifconfig
```

- On local machine, download this repository and tranfer to Ubuntu core by scp:
```
#(on local machine)
wget https://github.com/dnatividade/Ubuntu_core_15.04-install/archive/master.zip
scp master.zip ubuntu@IP_ADDRESS_UBUNTU:/home/ubuntu/
```

- Log on Ubuntu with ssh and extract the zip file:
```
#(on local machine)
ssh ubuntu
gunzip master.zip
```

---

With this repository on Ubuntu, install necessary packages. Each script installs the module corresponding to its name (and its dependencies). The *install-ALL.sh* module installs all modules from the repository.


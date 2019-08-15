# Ubuntu_core_15.04-install ![docs-trainings](https://img.shields.io/badge/docs-PtBR-green)
#### Package installation procedures on Ubuntu Core 15.04 and Gumstix Overo platform (armhf)

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

<div class="text-white bg-red mb-2">
  .text-white on .bg-red
</div>

CAUTION
---
- - During boot, the screen stay empty (black). No beep and no image is shown on the screen. This time is about **1m30s**.
- - Ubuntu core has no graphical interface, just command line.
- - USB keybord doesn't work if directly connected on USB port. **You need to use a USB HUB for any USB device to work**, as shown in the image below:

![gumstix](https://raw.githubusercontent.com/dnatividade/Ubuntu_core_15.04-install/master/images/gumstix.jpg)

![gumstix](https://raw.githubusercontent.com/dnatividade/Ubuntu_core_15.04-install/master/images/gumstix2.jpg)




---
### draft...

- Log on Ubuntu with default credentials:
```
user: ubuntu
pass: ubuntu
```

- Remount file system as RW, as follows:
```
$ sudo mount / -o remount,rw
```

- **CAUTION**: this Ubuntu image comes with a public key in the `authorized_keys` SSH file (called ash@gumstux). Remove it immediately, with the following commands:
```
rm /ubuntu/.ssh/authorized_keys
sudo rm /root/.ssh/authorized_keys
```

- Change password:
```
$ passwd
NEW_PASSWORD
```

- To supress the warning message: `sudo: unable to resolve host overo`, insert `127.0.0.1 overo` into */etc/hosts* file.
- Get IP address:
```
$ ifconfig
```

- On local machine, download this repository, convert to tar.bz2 and tranfer to Ubuntu core by scp:
```
#(on local machine)
wget https://github.com/dnatividade/Ubuntu_core_15.04-install/archive/master.zip

unzip master.zip && mv Ubuntu_core_15.04-install-master/ master && tar -cvjf master.tar.bz2 master/ && rm master/ -rf && rm master.zip

scp master.tar.bz2 ubuntu@IP_ADDRESS_UBUNTU:/home/ubuntu/
```

- Log on Ubuntu with ssh and extract the *.tar.bz2* file:
```
#(on local machine)
ssh ubuntu@@IP_ADDRESS_UBUNTU

$ tar -xvjf master.tar.bz2
```

---

With this repository on Ubuntu, install necessary packages. Each script installs the module corresponding to its name (and its dependencies). The *install-ALL.sh* module installs all modules from the repository.


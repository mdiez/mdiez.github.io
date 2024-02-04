---
layout: post
title:  "How to do BIOS updates (or downgrades) on Lenovo hardware under Linux"
date:   2024-02-03 22:31:13 +0200
categories: it
---

# Disclaimer
I am not assuming any responsibility or liability. You are following this tutorial at your own risk. BIOS updates are inherently risky and might brick your device!

# Prerequisites
This post assumes you have already
1. downloaded the relevant BIOS update as described in [this blogpost](/it/2024/02/03/Downgrade-Lenovo-BIOS-fix-sleep-problems.html)
2. manually extracted the BIOS update package as described in [this blogpost](/it/2024/02/03/Manually-unpack-Lenovo-update-packages.html).

# Generate boot media
The easiest way to flash your Lenovo BIOS under Linux is to create a bootable USD thumbdrive.
## Script to prepare the media
Unfortunately, in the update package, Lenovo is only providing a batch file to create a boot media under Windows. The relevant file is called ```mkusbkey.bat```. Thus, we have to create a Linux-compatible script. I have "translated" the batch file into a bash script.
1. Download the USB media creation script from [here](/mkusbkey.sh). Save it to the same directory where ```mkusbkey.bat``` resides.
2. Plug a USB thumbdrive into your computer. Make sure it's formatted with FAT32 and backup it before the next step.
3. Mark the downloaded script as executable by running
```# chmod +x ./mkusbkey.sh```
4. Now, execute the script by running
```# ./mkusbkey.sh <mountpoint_of_thumbdrive>```
5. Once the process is completed, restart your computer. Make sure that booting from external media is enabled by repeatedly pressing the ```Enter``` key during the boot process and press the ```F1``` key to enter the BIOS setup. Once in there, go to ```Boot```, ```Startup``` or similar and make sure the respective settings are in place.
6. Boot from the USB thumbdrive and follow the steps to update or downgrade your BIOS.

_If this post was valuable for you, consider [donating](https://www.paypal.com/donate/?hosted_button_id=FW2YGYBRUPYBS)._

---
layout: post
title:  "How to do BIOS updates (or downgrades) on Lenovo hardware under Linux"
date:   2024-02-03 22:31:13 +0200
categories: it
---

# Prerequisites
I assume you have
1. downloaded the relevant BIOS update as described in [this blogpost](/it/2024/02/03/Downgrade-Lenovo-BIOS-fix-sleep-problems.html)
2. manually extracted the BIOS update package as described in [this blogpost](/it/2024/02/03/Manually-unpack-Lenovo-update-packages.html).

# Generate boot media
The easiest way to flash your Lenovo BIOS under Linux is to create a bootable USD thumbdrive.
## Script to prepare the media
Unfortunately, in the update package, Lenovo is only providing a batch file to create a boot media under Windows. The relevant file is called ```mkusbkey.bat```. Thus, we have to create a Linux-compatible script. I have translated the batch file into a bash script which you can download from [here]

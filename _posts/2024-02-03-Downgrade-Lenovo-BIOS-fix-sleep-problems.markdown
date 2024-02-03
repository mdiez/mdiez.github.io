---
layout: post
title:  "How to downgrade a BIOS on Lenovo laptops and fix sleep problems"
date:   2024-02-03 19:28:21 +0200
categories: devops it-infrastructure
---

# Lenovo BIOSes are going downhill
While I love some Lenovo hardware (especially the T4**s/T14s series), the quality of the BIOSes that Lenovo is putting out these days is getting worse and worse. Currently, my daily driver is a Lenovo T14s Gen 3, and I found that the recenPackage  (ID)t BIOS versions (e.g., 1.35, 1.31) caused problems because my the machine would no longer wake up from sleep mode. While with previous BIOS versions this only occurred occassionally, with 1.35/1.31 it became a routine symptom and made life very difficult.

Thus I decided to downgrade to a previos BIOS version which behaved in a more stable manner. Since it is not straightforward to downgrade these machines, here is a full tutorial on how to go about this.

# How to download previous BIOS versions
The support pages on the Lenovo website routinely only link to the most recent BIOS version. Thus, a little copy/paste gymnastics are required to download older versions:
1. Go to the [Lenovo PC Support website](https://pcsupport.lenovo.com) and select your PC/laptop model. In my case, it's the [T14s Gen 3 AMD](https://pcsupport.lenovo.com/cy/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t14s-gen-3-type-21cq-21cr).
2. In the menu on the left side, select `Drivers & Software` and then under `Manual Update`, click `Select Drivers`:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/52b7c1fc-0fb0-4f8b-8953-c2c87bda3c57)
3. Click on the tile `BIOS/UEFI`:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/72f7da5b-26fe-4559-bf8a-34d6de20c176)
4. Download the `README` textfile and open it in a separate tab.
5. Make a right click on the `Download` button for the `BIOS Update Utility`, and select `Copy Link` from the context menu to save the link to the clipboard:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/816af255-36b9-49bd-8955-83b3b673f231)
(in my case, the link is `https://download.lenovo.com/pccbbs/mobiles/r22uj65w.exe`)
6. In the README text file, scroll down to the section `VERSION HISTORY`. For my BIOS, the section looks like this, and it lists all previous relases, along with their `Package  (ID)`:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/5abe7ac0-a8dc-4fc1-9b9b-0cbeafcec04f)
7. Now, in order to download a previous release, paste the link you saved under step 4.2 and swap out the filename before the extension with the respective `Package` identifier. For example, if I want to download UEFI version 1.30, the associated `Package ID` would be `R22UJ60W` and thus, the download link is:
`https://download.lenovo.com/pccbbs/mobiles/R22UJ60W.exe`.
8. At this point, I suggest you download all past BIOSes when you're at it and just save them to your hard drive. This way you still have them, in case Lenovo removes them from their servers in the future. Also, if you have the former BIOSes readily available, you can downgrade in a few minutes and thus accelerate your troublshooting efforts.

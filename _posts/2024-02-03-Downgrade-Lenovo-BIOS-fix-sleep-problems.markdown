---
layout: post
title:  "How to fix sleep problems on Lenovo laptops by downgrading the BIOS"
date:   2024-02-03 19:28:21 +0200
categories: it
---

# Disclaimer
**I assume no guarantee or warranty, no responsibility or liability for whatever you might be doing based on the information in this post. Changing your computer's BIOS is inherently risky and, in very rare cases, you might brick your device entirely. Also, there are apparently cases where the operating system (Windows 11) didn't boot anymore after a BIOS downgrade, and users had to reinstall it. Thus, make a backup of all your data first, before proceeding! (Thanks to [crispy42 in the Lenovo Support Forums](https://forums.lenovo.com/t5/ThinkPad-T400-T500-and-newer-T-series-Laptops/Please-bring-back-S3-sleep/m-p/5285890?page=1#6247782) for this hint!)**

# Lenovo BIOSes are going downhill
While I love some Lenovo hardware (especially the T4**s/T14s series), the quality of the BIOSes that Lenovo is putting out these days is getting worse and worse. Currently, my daily driver is a Lenovo T14s Gen 3, and I found that the recent BIOS versions (e.g., 1.35, 1.31) caused serious problems because my the machine would no longer wake up from sleep mode. While with previous BIOS versions this only occurred occassionally, with 1.35/1.31 it became a routine symptom and made life very difficult.

If you google around, you will find that many users suffer from these symptoms, complaining, for example, in the [Lenovo support forums](https://forums.lenovo.com/t5/ThinkPad-T400-T500-and-newer-T-series-Laptops/T14-won-t-wake-up-out-sleep/m-p/5155189?page=1) and on [Reddit](https://www.reddit.com/r/thinkpad/comments/w35d1w/new_t14s_gen_3_amd_sleep_issues_already/) (these are just the top search results; there are many more threads). I've tried many different things, such as installing Ubuntu instead of Windows, and changing various power settings under both operating systems -- to no avail.

Thus I decided to take a more systematic approach. I remembered that initially, when I got the machine, I didn't have these problems. Since then, various BIOS updates were applied via Lenovo's System Updater tool. I figured there might be a connection here, so I decided that, each time the problem would occur, I would downgrade my machine's BIOS to the preceding version (so I went from 1.35 to 1.31 to 1.30). Then, after each downgrade, I would test if the problem was resolved by using the computer normally, which includes putting it to sleep at various times during the day and for the night.

I found out, that for my configuration, BIOS version 1.30 (from Lenovo software package R22UR60W) was stable and I haven't had a single occurrence of the computer not waking up from sleep anymore in almost three weeks. Since it is not straightforward to find the necessary files on Lenovo's servers, here is a full tutorial on how to do this.

# How to download previous BIOS versions
The support pages on the Lenovo website routinely only link to the most recent BIOS version. Thus, a little copy/paste gymnastics are required to download older versions:
1. Go to the [Lenovo PC Support website](https://pcsupport.lenovo.com) and select your PC/laptop model. In my case, it's the [T14s Gen 3 AMD](https://pcsupport.lenovo.com/cy/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t14s-gen-3-type-21cq-21cr).
2. In the menu on the left side, select `Drivers & Software` and then under `Manual Update`, click `Select Drivers`:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/52b7c1fc-0fb0-4f8b-8953-c2c87bda3c57)
3. Click on the tile `BIOS/UEFI`:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/72f7da5b-26fe-4559-bf8a-34d6de20c176)
4. Download the `README` textfile and open it in a separate tab.
5. Make a right click on the `Download` button for the `BIOS Update Utility`, and select `Copy Link` from the context menu to save the link to the clipboard:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/61ca2fec-9532-434e-97cf-969762e2b06f)
(in my case, the link is `https://download.lenovo.com/pccbbs/mobiles/r22uj65w.exe`)
6. In the README text file, scroll down to the section `VERSION HISTORY`. For my BIOS, the section looks like this, and it lists all previous relases, along with their `Package  (ID)`:
![image](https://github.com/mdiez/mdiez.github.io/assets/7477044/5abe7ac0-a8dc-4fc1-9b9b-0cbeafcec04f)
7. Now, in order to download a previous release, paste the link you saved under step 4.2 and replace the filename before the extension with the respective `Package` identifier. For example, if I want to download UEFI version 1.30, the associated `Package ID` would be `R22UJ60W` and thus, the download link is:
`https://download.lenovo.com/pccbbs/mobiles/R22UJ60W.exe`.
8. At this point, **I suggest you download all past BIOSes** while you're at it and just save them to your hard drive. This way you still have them even if Lenovo should remove them from their servers in the future. Also, if you have the former BIOSes readily available, you can downgrade in a few minutes and thus accelerate your troublshooting efforts.
9. If you are running Windows, you can now double click on the downloaded exe file and follow the instructions to downgrade your BIOS. If you are running Linux, you'll need to manually unpack the downloaded exe files and create a boot medium. Find out how you can do this in the [follow up blog post about manually extracting Lenovo update packages](/it/2024/02/03/Manually-unpack-Lenovo-update-packages.html).

<span style="color: red;">**If this post was valuable for you, consider [donating](https://www.paypal.com/donate/?hosted_button_id=FW2YGYBRUPYBS).**</span>

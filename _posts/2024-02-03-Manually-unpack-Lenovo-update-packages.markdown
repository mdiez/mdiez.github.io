---
layout: post
title:  "How to manually unpack Lenovo update packages"
date:   2024-02-03 22:29:00 +0200
categories: it
---

# Deepdive into the Lenovo update packages format
Lenovo is supplying the drivers in exe files which can easily be unpacked in Windows (by double-clicking), but if you're working under another operating system, you'll have a harder time. Let's figure out what's contained in these files and how they work.
## 7zip
A quick analysis with 7z shows gives the following output:

`$ 7z l R22UJ60W.exe`
```
7-Zip [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
p7zip Version 16.02 (locale=en_US.UTF-8,Utf16=on,HugeFiles=on,64 bits,16 CPUs AMD Ryzen 7 PRO 6850U with Radeon Graphics      (A40F41),ASM,AES-NI)

Scanning the drive for archives:
1 file, 18459704 bytes (18 MiB)

Listing archive: R22UJ60W.exe

--
Path = R22UJ60W.exe
Type = PE
Physical Size = 18459704
CPU = x86
Characteristics = Executable 32-bit NoRelocs NoLineNums NoLocalSyms Little-Endian Big-Endian
Created = 2020-01-06 08:31:46
Headers Size = 1024
Checksum = 18504171
Image Size = 233472
Section Alignment = 4096
File Alignment = 512
Code Size = 151552
Initialized Data Size = 27648
Uninitialized Data Size = 0
Linker Version = 2.25
OS Version = 5.0
Image Version = 6.0
Subsystem Version = 5.0
Subsystem = Windows GUI
DLL Characteristics = Relocated NX-Compatible TerminalServerAware
Stack Reserve = 1048576
Stack Commit = 16384
Heap Reserve = 1048576
Heap Commit = 4096
Image Base = 4194304
Comment = FileVersion: 4.0.100.1124
FileVersion: 1.30.1.25           
ProductVersion: 1.30.1.25
ProductVersion: 1.30.1.25                                         
Comments: This installation was built with Inno Setup.
CompanyName: Lenovo Group Limited                                        
FileDescription: For Lenovo Updates Catalog                                  
LegalCopyright: Copyright © Lenovo 2021.                                                                            
ProductName: ThinkPad BIOS Update Utility -Package 1.5.11.3
```

The following line is of particular interest:
```Comments: This installation was built with Inno Setup.```

It seems that Lenovo is packaging its updates with Inno Setup.

## binwalk
We can also use `binwalk` to learn more about the structure of the file:

`$ binwalk R22UJ60W.exe`
```
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             Microsoft executable, portable (PE)
177264        0x2B470         XML document, version: "1.0"
2512226       0x265562        LZMA compressed data, properties: 0x5D, dictionary size: 8388608 bytes, uncompressed size: 65536 bytes
2852875       0x2B880B        Intel x86 or x64 microcode, sig 0x000906a1, pf_mask 0x82, 2021-11-04, rev 0x011f, size 184320
3229639       0x3147C7        Intel x86 or x64 microcode, sig 0x000906a3, pf_mask 0x80, 2021-12-16, rev 0x0414, size 205824
5344536       0x518D18        Zlib compressed data, best compression
5419579       0x52B23B        Zlib compressed data, best compression
16891496      0x101BE68       LZMA compressed data, properties: 0x5D, dictionary size: 8388608 bytes, uncompressed size: 65536 bytes
17681332      0x10DCBB4       LZMA compressed data, properties: 0x5D, dictionary size: 2097152 bytes, missing uncompressed size
18450440      0x1198808       Object signature in DER format (PKCS header length: 4, sequence length: 9254
18450581      0x1198895       Certificate in DER format (x509 v3), header length: 4, sequence length: 1712
18452297      0x1198F49       Certificate in DER format (x509 v3), header length: 4, sequence length: 1767
18454774      0x11998F6       Object signature in DER format (PKCS header length: 4, sequence length: 4920
18455063      0x1199A17       Certificate in DER format (x509 v3), header length: 4, sequence length: 1782
18456849      0x119A111       Certificate in DER format (x509 v3), header length: 4, sequence length: 1772
```

This shows that there are multiple archives nested in the `exe` file.

# How to manually extract the update package
There is an excellent tool called `innoextract`. You can find more information about it on its [website](https://constexpr.org/innoextract/) and the [GitHub repo](https://github.com/dscharrer/innoextract).
Now, in order to extract the update file, follow the steps:
1. Install `innoextract` from its source code or one of the ready-made packages, both can be found on [this webpage](https://constexpr.org/innoextract/#packages).
2. Open a new shell/terminal and run the command
`innoextract <exe update file>`, e.g., `innoextract R22UJ60W.exe`.
3. The utility will extract the contents of the update package to a subdirectory in the current directory. In my case, the directory was called `code$GetExtractPath$`.

If you intend to update or downgrade your Lenovo machine's BIOS under Linux, please read the [follow-up blogpost](/it/2024/02/03/Lenovo-BIOS-update-downgrade-under-Linux.html).

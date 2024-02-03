#!/bin/bash

# Displaying introductory information
echo
echo "  Linux tool to create a bootable BIOS flash USB memory key"
echo "  Version 1.01"
echo

# Setting variables
Drive=$1
DefaultDir=$(pwd)

# Check for syntax error (no drive specified)
if [ -z "$1" ]; then
  echo
  echo "Syntax : mkusbkey [Drive]"
  echo
  echo "[Drive]"
  echo "  /dev/sdx : Device identifier of USB memory key"
  echo
  echo "Example : mkusbkey /dev/sdx"
  echo
  exit 1
fi

echo
echo "  Creating directories."
echo

# Creating directories
mkdir -p "$Drive/EFI/Boot" || { echo "ERROR: Directory was not able to be created in USB memory key."; exit 1; }
mkdir -p "$Drive/Flash" || { echo "ERROR: Directory was not able to be created in USB memory key."; exit 1; }

echo
echo "  Copying files."
echo

# Copying files
cp Rfs/Usb/BootX64.efi "$Drive/EFI/Boot/BootX64.efi" > /dev/null || { echo "ERROR: Related file was not able to be copied to USB memory key."; exit 1; }
cp Rfs/Usb/SHELLFLASH.EFI "$Drive/Flash/SHELLFLASH.EFI" > /dev/null || { echo "ERROR: Related file was not able to be copied to USB memory key."; exit 1; }
cp Rfs/Bcp/Japan/ThinkPad/BCP.evs "$Drive/Flash/BCP.evs" > /dev/null || { echo "ERROR: Related file was not able to be copied to USB memory key."; exit 1; }
cp Rfs/Bin/Japan/X64/*.PAT "$Drive/Flash/" > /dev/null || { echo "ERROR: Related file was not able to be copied to USB memory key."; exit 1; }
cp -r Rfs/Fw/* "$Drive/Flash/" > /dev/null || { echo "ERROR: Related file was not able to be copied to USB memory key."; exit 1; }

echo
echo "Operation completed successfully."
echo

# Return to the original directory
cd "$DefaultDir"

exit 0

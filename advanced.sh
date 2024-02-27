#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

disks=$(lsblk -o NAME -npl)

perform_wipe() {
  sudo dd if=/dev/urandom of=$1 bs=4M status=progress
}

for disk in $disks; do
  ( perform_wipe "$disk" ) &  # Run in subshell to execute in background + paraller
done
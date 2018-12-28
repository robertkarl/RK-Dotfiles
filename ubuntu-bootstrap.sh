#! /usr/bin/env sh
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root. Exiting."
  exit
fi
set -e
apt update
apt install -y $(cat deps.txt)
apt upgrade -y

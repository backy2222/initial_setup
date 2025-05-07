#!/bin/bash

# setup_init.sh - Initial system setup for ax-controller

# Create user
sudo adduser backy
sudo usermod -aG sudo backy
sudo usermod -aG docker backy

# Prompt for hostname
read -p "Enter new hostname for this VPS: " new_hostname
sudo hostnamectl set-hostname "$new_hostname"

echo
echo "[✓] Setup complete."
echo "You can now exit and log in again as the 'backy' user."

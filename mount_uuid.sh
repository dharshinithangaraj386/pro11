#!/bin/bash

# ==========================================
# Mount Filesystem Using UUID
# Student Name:
# Roll Number:
# ==========================================

# Exit immediately if a command exits with a non-zero status
set -e

# Configuration Variables
MOUNT_DIR="/mnt/target_drive"
# NOTE: Replace the value below with your actual partition name (e.g., /dev/sdb1)
TARGET_PARTITION="/dev/sdb1"

echo "======================================"
echo " Mounting Filesystem via UUID"
echo "======================================"

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root (or via sudo)." >&2
    exit 1
fi

# Display filesystem UUID
echo "Step 1: Displaying filesystem UUIDs..."
# blkid displays attributes of block devices. 
# lsblk -o NAME,UUID is an excellent modern alternative.
blkid "$TARGET_PARTITION" || blkid


# Create mount directory
echo -e "\nStep 2: Creating mount directory at ${MOUNT_DIR}..."
mkdir -p "$MOUNT_DIR"
echo "Directory verified."


# Mount filesystem using UUID
# Replace YOUR_UUID with actual UUID
echo -e "\nStep 3: Mounting filesystem via UUID..."
# INSTRUCTION FOR STUDENT: Run the script once, copy the UUID from Step 1, 
# and substitute it into the variable below.
YOUR_UUID="PASTE_YOUR_UUID_HERE"

if [ "$YOUR_UUID" = "PASTE_YOUR_UUID_HERE" ]; then
    echo "WARNING: You need to replace 'PASTE_YOUR_UUID_HERE' with your real block device UUID."
    echo "Attempting backup mount directly using the partition node name instead..."
    mount "$TARGET_PARTITION" "$MOUNT_DIR"
else
    mount -U "$YOUR_UUID" "$MOUNT_DIR"
    echo "Successfully mounted UUID: ${YOUR_UUID}"
fi


# Display mounted filesystem
echo -e "\nStep 4: Verifying mounted filesystems..."
df -h | grep "$MOUNT_DIR" || mount | grep "$MOUNT_DIR"

echo -e "\nMount process completed!"

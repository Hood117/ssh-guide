#!/bin/bash

echo "=== Setup SSH Host Shortcut ==="

read -p "Nickname (e.g. myserver): " nickname
read -p "Remote user (e.g. root): " user
read -p "Remote IP address: " host
read -p "Port (default 22): " port
port=${port:-22}

# Make sure ~/.ssh/config exists
mkdir -p ~/.ssh
touch ~/.ssh/config

# Add the host entry
echo "
Host $nickname
    HostName $host
    User $user
    Port $port
" >> ~/.ssh/config

echo "✅ Done! You can now SSH with:"
echo "➡️  ssh $nickname"

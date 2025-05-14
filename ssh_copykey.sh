#!/bin/bash

echo "=== Copy SSH Key to Remote Server ==="

read -p "Remote username: " user
read -p "Remote IP or hostname: " host

# Make sure public key exists
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "No SSH key found. Run ssh_keygen.sh first."
    exit 1
fi

ssh-copy-id "$user@$host"

echo "Done. You should be able to connect without a password now."

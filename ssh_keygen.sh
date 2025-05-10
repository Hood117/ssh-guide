#!/bin/bash

echo " SSH Key Pair Generator"

read -p "Enter your email (for key comment): " email

ssh-keygen -t rsa -b 4096 -C "$email"

echo "Key generated!"
echo "Public key: ~/.ssh/id_rsa.pub"
echo "Private key: ~/.ssh/id_rsa"


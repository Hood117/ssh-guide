#!/bin/bash

echo "=== SSH Hardening Script ==="

# Set your custom port or use default
read -p "Enter new SSH port (default 22): " new_port
new_port=${new_port:-22}

# Backup config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Apply changes
sudo sed -i "s/^#Port .*/Port $new_port/" /etc/ssh/sshd_config
sudo sed -i "s/^Port .*/Port $new_port/" /etc/ssh/sshd_config
sudo sed -i "s/^#PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config
sudo sed -i "s/^PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config
sudo sed -i "s/^#PasswordAuthentication .*/PasswordAuthentication no/" /etc/ssh/sshd_config
sudo sed -i "s/^PasswordAuthentication .*/PasswordAuthentication no/" /etc/ssh/sshd_config

# Reload SSH
sudo systemctl restart sshd

echo "✅ SSH hardened. Root login & password auth are disabled."
echo "➡️ Remember your SSH port: $new_port"


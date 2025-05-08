#!/bin/bash

echo " Setting up SSH..."

# Install OpenSSH Server
sudo dnf install -y openssh-server 2>/dev/null || sudo apt install -y openssh-server

# Enable and start SSH service
sudo systemctl enable sshd
sudo systemctl start sshd

# Open SSH port in firewall (if firewalld is active)
if systemctl is-active --quiet firewalld; then
    sudo firewall-cmd --permanent --add-service=ssh
    sudo firewall-cmd --reload
fi

# Optional config changes
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Allow root login and enable password authentication (editable)
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart to apply changes
sudo systemctl restart sshd

echo "✅ SSH setup done. You can now connect with: ssh user@IP"

#!/bin/bash

echo "=== SSH Service & Firewall Status ==="

# Check sshd service
echo -n "SSH service: "
systemctl is-active --quiet sshd && echo "🟢 running" || echo "🔴 not running"

echo -n "SSH enabled on boot: "
systemctl is-enabled --quiet sshd && echo "✅ yes" || echo "❌ no"

# Check firewall and SSH port
if systemctl is-active --quiet firewalld; then
    echo "Firewall: 🟢 active"
    echo "Open SSH ports:"
    sudo firewall-cmd --list-all | grep ports
else
    echo "Firewall: 🔴 inactive"
fi

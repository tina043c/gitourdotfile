#!/bin/bash
set -e

echo "Installing Grafana..."

# Add Grafana APT repo
sudo apt-get install -y software-properties-common
sudo apt-get install -y gnupg2 curl
curl -fsSL https://packages.grafana.com/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/grafana.gpg
echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Install Grafana
sudo apt-get update
sudo apt-get install -y grafana

# Start Grafana service
sudo service grafana-server start

echo "Grafana installation complete!"
echo "to use it, forward port 3000"

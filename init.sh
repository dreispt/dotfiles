#!/bin/sh

set -e

echo "==> Starting PostgreSQL service..."
sudo service postgresql restart

echo "==> Updating package lists..."
sudo apt update

echo "==> Upgrading packages..."
sudo apt -y upgrade

echo "==> Removing unused packages..."
sudo apt -y autoremove

echo "==> Session initialization complete."


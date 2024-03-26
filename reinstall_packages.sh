#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to reinstall packages using apt
reinstall_apt_packages() {
  apt update
  apt install --reinstall -y $(dpkg --get-selections | grep -v deinstall | cut -f1)
}

# Function to reinstall packages using rpm
reinstall_rpm_packages() {
  dnf reinstall -y $(rpm -qa)
}

# Function to reinstall packages using pip
reinstall_pip_packages() {
  pip freeze | cut -d = -f 1 | xargs -n1 pip install -I --ignore-installed
}

# Function to reinstall packages using npm
reinstall_npm_packages() {
  npm update -g
}

# Main function to identify package managers and reinstall packages
main() {
  echo "Identifying and reinstalling packages..."

  if command_exists apt; then
    echo "Detected apt package manager..."
    reinstall_apt_packages
  fi

  if command_exists rpm; then
    echo "Detected rpm package manager..."
    reinstall_rpm_packages
  fi

  if command_exists pip; then
    echo "Detected pip package manager..."
    reinstall_pip_packages
  fi

  if command_exists npm; then
    echo "Detected npm package manager..."
    reinstall_npm_packages
  fi

  echo "Package reinstallation complete."
}

# Execute main function
main

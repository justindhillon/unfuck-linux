#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to reinstall packages using apt
reinstall_apt_packages() {
  sudo apt update
  sudo apt install --reinstall -y $(dpkg --get-selections | grep -v deinstall | cut -f1)
}

# Function to reinstall packages using rpm
reinstall_rpm_packages() {
  sudo rpm reinstall -y $(rpm -qa)
}

# Function to reinstall packages using pip
reinstall_pip_packages() {
  pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
}

# Function to reinstall packages using npm
reinstall_npm_packages() {
  npm update -g
}

# Function to reinstall packages using Homebrew
reinstall_brew_packages() {
  brew reinstall $(brew list)
}

# Function to reinstall packages using flatpak
reinstall_flatpack_packages() {
  flatpak list --app --columns=application | xargs -n1 flatpak reinstall -y
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

  if command_exists brew; then
    echo "Detected Homebrew package manager..."
    reinstall_brew_packages
  fi

  if command_exists flatpak; then
    echo "Detected flatpak package manager..."
    reinstall_flatpak_packages
  fi

  echo "Package reinstallation complete."
}

# Execute main function
main

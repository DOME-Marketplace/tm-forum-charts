#!/bin/bash

set -e

# Install Helm v3.13.3
wget "https://get.helm.sh/helm-v3.13.3-linux-amd64.tar.gz"
tar zxf helm-v3.13.3-linux-amd64.tar.gz
mkdir -p bin
mv linux-amd64/helm ./bin/helm
chmod +x ./bin/helm

# Install kubeval v0.16.1
wget "https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz"
tar -C ./bin -xf ./kubeval-linux-amd64.tar.gz kubeval
chmod +x ./bin/kubeval

# Add bin to PATH
export PATH="$(pwd)/bin:$PATH"

echo "Installed tools:"
./bin/helm version
./bin/kubeval --version
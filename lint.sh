#!/bin/bash

set -e

echo "Linting Helm chart in sbx/"

# Add bitnami repo for redis dependency
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Update dependencies
cd sbx
helm dependency update

# Lint the chart
helm lint .

echo "Chart linting completed successfully"

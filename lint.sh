#!/bin/bash

set -e

echo "Linting Helm chart in charts/tm-forum-api-sbx/"

# Add bitnami repo for redis dependency
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Update dependencies
cd charts/tm-forum-api-sbx
helm dependency update

# Lint the chart
helm lint .

echo "Chart linting completed successfully"

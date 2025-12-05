#!/bin/bash

set -e

echo "Evaluating Helm chart templates in charts/tm-forum-api-sbx/"

# Add bitnami repo for redis dependency
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Update dependencies
cd charts/tm-forum-api-sbx
helm dependency update

# Template the chart and validate with kubeval
echo "Rendering templates..."
helm template test-release . > /tmp/rendered-templates.yaml

echo "Validating templates with kubeval..."
../../bin/kubeval --ignore-missing-schemas /tmp/rendered-templates.yaml

echo "Chart evaluation completed successfully"

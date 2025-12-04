# TM Forum Charts

Helm chart repository for deploying FIWARE TMForum APIs on Kubernetes for the DOME Marketplace.

## Overview

This repository contains a Helm chart for deploying TMForum API microservices that interact with an NGSI-LD context broker. The chart deploys 16 different TMForum API services including party-catalog, product-catalog, customer-management, and more.

**Chart Location**: [`sbx/`](./sbx/)

## Quick Start

### Adding the Helm Repository

```bash
helm repo add tmforum https://dome-marketplace.github.io/tm-forum-charts
helm repo update
```

### Installing the Chart

```bash
# Install with default values
helm install my-tmforum tmforum/tm-forum-api -n tmforum --create-namespace

# Install with custom values
helm install my-tmforum tmforum/tm-forum-api -n tmforum -f custom-values.yaml
```

### Uninstalling the Chart

```bash
helm uninstall my-tmforum -n tmforum
```

## Chart Documentation

For detailed chart configuration, see the [chart README](./sbx/README.md).

Key features:
- 16 TMForum API microservices
- Shared default configuration with per-API overrides
- NGSI-LD context broker integration
- Redis caching support
- Optional API proxy with Envoy

## Repository Structure

```
tm-forum-charts/
├── sbx/                    # Main Helm chart directory
│   ├── Chart.yaml         # Chart metadata
│   ├── values.yaml        # Default configuration
│   ├── templates/         # Kubernetes manifests
│   └── README.md          # Chart documentation
├── .github/
│   ├── workflows/         # CI/CD workflows
│   └── build/             # Build scripts
├── lint.sh                # Chart linting script
└── eval.sh                # Template validation script
```

## Development & Contributing

### Prerequisites

- Helm 3.13+
- kubectl
- Access to a Kubernetes cluster (for testing)

### Local Development

#### 1. Clone the repository

```bash
git clone https://github.com/DOME-Marketplace/tm-forum-charts.git
cd tm-forum-charts
```

#### 2. Make changes to the chart

Edit files in the `sbx/` directory:
- `values.yaml` - Configuration values
- `templates/` - Kubernetes manifests
- `README.md.gotmpl` - Chart documentation template

#### 3. Test your changes

```bash
# Lint the chart
./lint.sh

# Validate templates
helm template test-release sbx/

# Test installation (dry-run)
helm install test-release sbx/ --dry-run --debug
```

#### 4. Update documentation

```bash
# Install helm-docs if not already installed
# See: https://github.com/norwoodj/helm-docs

# Generate README from template
helm-docs sbx/
```

### Contributing via Pull Request

#### 1. Create a feature branch

```bash
git checkout -b feature/my-changes
```

#### 2. Make and commit your changes

```bash
git add sbx/
git commit -m "Description of changes"
git push origin feature/my-changes
```

#### 3. Create a Pull Request

Create a PR on GitHub and add one of these labels:
- `patch` - Bug fixes (0.14.15 → 0.14.16)
- `minor` - New features (0.14.15 → 0.15.0)
- `major` - Breaking changes (0.14.15 → 1.0.0)

#### 4. Automated CI Checks

When you create a PR, GitHub Actions will automatically:
- ✅ Lint the chart
- ✅ Validate templates with kubeval
- ✅ Bump version based on label
- ✅ Regenerate documentation
- ✅ Commit updates back to your PR

#### 5. Merge and Release

After PR approval and merge to `main`:
- Chart is automatically packaged
- GitHub Release is created
- Chart is published to `gh-pages` branch
- Available via Helm repo: `https://dome-marketplace.github.io/tm-forum-charts`

## CI/CD Workflows

This repository uses GitHub Actions for continuous integration and deployment:

### PR Workflows
- **check-labels.yml** - Ensures PR has a version bump label
- **check.yml** - Lints, validates, and auto-versions the chart

### Deployment Workflow
- **deploy.yml** - Publishes chart to GitHub Pages on push to `main`

### Branch Protection

For production use, configure branch protection on `main`:
1. Require pull requests
2. Require status checks: `lint`, `eval`, `check`
3. Require conversation resolution

This ensures all changes go through the proper CI pipeline.

## Chart Versioning

Chart versions follow [Semantic Versioning](https://semver.org/):

- **MAJOR** - Incompatible API changes or breaking changes
- **MINOR** - New functionality in a backwards compatible manner
- **PATCH** - Backwards compatible bug fixes

Version bumps are automated based on PR labels during the CI process.

## Support & Issues

- **Chart Issues**: [sbx/README.md](./sbx/README.md#troubleshooting)
- **API Source Code**: [DOME-Marketplace/tmforum-api](https://github.com/DOME-Marketplace/tmforum-api)
- **Report Bugs**: [GitHub Issues](https://github.com/DOME-Marketplace/tm-forum-charts/issues)

## License

This chart is maintained by the DOME Marketplace project.

## Maintainers

- Stefan Wiedemann (@wistefan) - stefan.wiedemann@fiware.org
- Daniel Ros (@droslbl) - d.ros@libelium.com

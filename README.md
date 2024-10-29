# Deployment with Kubernetes

This repository contains the manifests and scripts to deploy the application with Kubernetes.

## Prerequisites

- A Kubernetes cluster
- kubectl

## Configuration

Before deploying the application, you need to configure sealed secrets keys. Just upload all the keys to the [system/sealed-secrets-keys](system/sealed-secrets-keys) directory.

## Deploy

To deploy the application, run the following command:

```bash
./apply.sh
```

## Undeploy

To undeploy the application, run the following command:

```bash
./delete.sh
```

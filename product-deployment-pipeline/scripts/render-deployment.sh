#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage: ./scripts/render-deployment.sh <dev|qa|prod>"
  exit 1
fi

CONFIG_FILE="product-kubernetes/environments/${ENV}.properties"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Environment config not found: $CONFIG_FILE"
  exit 1
fi

source "$CONFIG_FILE"

mkdir -p product-kubernetes/rendered/$ENV

envsubst < product-kubernetes/templates/deployment-template.yaml > product-kubernetes/rendered/$ENV/deployment.yaml
envsubst < product-kubernetes/templates/service-template.yaml > product-kubernetes/rendered/$ENV/service.yaml

echo "Rendered Kubernetes manifests for $ENV"
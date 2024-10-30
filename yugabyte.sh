#!/bin/bash

# Execute the Helm command
echo "Running Helm command:"

kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml

helm upgrade --install yugabyte-master ./ --namespace infra --create-namespace -f ./values-master.yaml
helm upgrade --install yugabyte-tenant-a ./ --namespace infra --create-namespace -f ./tenant/values-a.yaml
helm upgrade --install yugabyte-tenant-b ./ --namespace infra --create-namespace -f ./tenant/values-b.yaml
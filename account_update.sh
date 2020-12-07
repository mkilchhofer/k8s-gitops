#!/bin/bash -e

for namespace in $(kubectl get namespaces -A -o json | jq -r '.items[].metadata.name'); do
  echo -ne "Processing namespace ${namespace}: \t"
  kubectl patch serviceaccount default -n ${namespace} -p "$(cat account_update.yaml)"
done

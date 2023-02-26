#!/bin/sh

. scripts/exports.sh

# This will of course require privilege escalation
sudo rm -rf ~/dev/volumes/data-workshop

k3d cluster create -c assets/k3d.config.yml
for ns in "postgres" "grafana"; do
  kubectl create ns $ns; 
done
helm -n postgres install data-workshop .helm/postgres

helm install grafana-operator .helm/grafana-operator
helm install grafana .helm/grafana

watch kubectl get po -A

#!/bin/sh

. scripts/exports.sh

TARGET_NS=postgres
INSTALLATION_NAME=data-workshop

# This will of course require privilege escalation
sudo rm -rf ~/dev/volumes/data-workshop

k3d cluster create -c assets/k3d.config.yml
kubectl create ns "$TARGET_NS"
helm -n "$TARGET_NS" install "$INSTALLATION_NAME" .helm
kubectl -n "$TARGET_NS" get po --watch

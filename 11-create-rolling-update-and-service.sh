#!/bin/bash
source .env
kubectl create deployment ${APP_NAME}-rolling-update \
        --image=${DOCKER_HUB_USERNAME}/{$APP_NAME}:red
echo add minReadySeconds and ports: 80 protocol: TCP 
read 
kubectl edit deployment {APP_NAME}-rolling-update
kubectl expose deployment hugo-app-rolling-update --name=hugo-app-rolling-update-svc \
        --type=LoadBalancer --port=80 --target-port=80

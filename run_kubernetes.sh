#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=ltphuongduy/project4-api
podname=microservice-project4-api
# Step 2
# Run the Docker Hub container with kubernetes
iscreated=$(kubectl get pod $podname 2> /dev/null; echo $?)
if [ "$iscreated" == "1" ] 
then
    kubectl run $podname \
    --image=$dockerpath \
    --port=80 --labels app=project4-api
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $podname 8080:80

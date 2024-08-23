#!/bin/bash

# check to see if minikube is already there
if ! [ -f /usr/local/bin/minikube ]; then
  # Download and "install" Minikube
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
fi
#Add the addons
# Replace this by adding it to the start command
##minikube addons enable registry
#minikube addons enable ingress
#minikube addons enable ingress-dns
#minikube addons enable dashboard
#minikube addons enable metrics-server

# Need to allow the user to do -n and give a profile name other than minikube
# start minikube
# This statement only looks for a -p flag. If we wanted x as additional flag
# this line would read  while getopts "px:" flag; do   And then add the case for x
# For the multi-flag scenario you should probably just use these cases to set flag variable
# Once they are all set, then do the real work
while getopts "p:" flag; do
 case $flag in
   p) # Handle the -p profile flag
    minikube start --insecure-registry="192.0.0.0/24,10.0.0.0/24" -p $OPTARG --container-runtime=cri-o
   ;;
   *) #handle any other flag or lack of flag
    minikube start --insecure-registry="192.0.0.0/24,10.0.0.0/24" --container-runtime=crio
   ;;
 esac
done

# set up a proxy from the local machine to the registry in minikube
podman run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"
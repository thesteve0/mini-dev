# mini-dev
 This repository contains documents and scripts to help you set up minikube for local application development. The  main
 features added are:
1. Being able to push your container images to the registry in Minikube
2. Adds certificate management
3. Allowing connections from your local work machine to your minikube HTTP applications over HTTPS

For now the repository is mostly doc, but the hope is, over time, there will be a shell script where you specify what you want
and it will spin up your cluster for you. 

We chose minikube because it seems like the most straightforward path at the time of writing this. Please be sure to also check out 
alternate local Kubernetes installs such as [Kind](https://kind.sigs.k8s.io/), [k3s](https://k3s.io/), [k3d](https://k3d.io/v5.7.3/), and [MicroK8s](https://microk8s.io/). They each have different strengths and weaknesses and one of these might appeal more to your skill set or use case. 
# Spinnaker on GCP

This is a brief codelab on which you can try Continuous Deployment on Google Cloud Platform. 

## Scope of this codelab

* create a full Continuous Deployment process that follows this schema:
![pipeline schema](/pipeline/images/schema.png "Deployment process")

## Contents

This repository contains all the stuffs you'll need to build and try the entire pipeline. You'll use:
* Google Kubernetes Engine on which run: the application, a Spinnaker instance
* Google Cloud Build, to build the artifact
* Google Cloud Container Registry, to store your artifacts
* Google Cloud Pub/Sub, a message broker middleware useful for notifying events

## Setup

Start with creating a Google Cloud project: [console link](https://cloud.google.com/console). You can apply for a free initial voucher of $300.

Then follow [this codelab](https://cloud.google.com/solutions/continuous-delivery-spinnaker-kubernetes-engine), you'll create a Spinnaker installation on a cluster Google Kubernetes Engine.

## Execution

1. Fork this repo
1. Create a first version of Container image of both frontend and backend:
```bash
# canary
kubectl create -f ./delivery/canary/backend/
kubectl create -f ./delivery/canary/frontend/
kubectl create -f ./delivery/canary/ingerss.yaml

# production
kubectl create -f ./delivery/production/backend/
kubectl create -f ./delivery/production/frontend/
kubectl create -f ./delivery/production/ingerss.yaml
```
1. Create 2 Google Cloud Build trigger, one for the backend and one for the frontend as follow 
![trigger example](/pipeline/images/build_trigger.png "Build trigger example")
1. Create 4 pipelines in Spinnaker with the files provided in the folder "pipeline", but pay attention to replace its refs with the yours
1. Push your container images by executing these scripts:
```bash
cd source/backend
./commit_version.sh 1 # where 1 is the version number

cd ../frontend
./commit_version.sh 1 # where 1 is the version number
```

...if you followed all steps correctly you're viewing an awesome Cloud Build and Spinnaker executing.

You can loop these steps more and more to repeat the process:
```bash
cd source/backend
./commit_version.sh <version>

cd ../frontend
./commit_version.sh <version>
```

## Author
Fausto Fusaro [fausto.fusaro@injenia.it](mailto:fausto.fusaro@injenia.it)  
Google Cloud Solution Arhitect

## Contributors
Any contributor is my friend... feel free to contribute! :)

# License

Apache License Version 2.0
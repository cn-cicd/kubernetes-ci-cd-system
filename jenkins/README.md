# Jenkins #

This project deploys Jenkins on a Kubernetes cluster, the easiest way to test is using Minikube, a small Kubernetes environment that runs locally on your computer.

## Requirements ##

Install and configure Minikube. Follow the instructions in Kubernetes documentation.

    https://kubernetes.io/docs/getting-started-guides/minikube/

Install kubectl to control the Kubernetes cluster, follow instructions here:

    https://kubernetes.io/docs/tasks/tools/install-kubectl/
    https://kubernetes.io/docs/reference/kubectl/overview/

## Deploying Jenkins on Minikube ##

In this section I will show the commands to deploy Jenkins on Kubernetes.

1- Create a Kubernetes namespace where all other Kubernetes resources will be located.

    kubectl create -f namespace.yaml

2- Create ConfigMap with required environment variables. Here you can set required environment variables that need to be set on the container. Currently is an unused feature.  

    kubectl create -f environment-variables.yaml  

3- Create Kubernetes Persistent Volumne and Claim in order to persist data in Jenkins.

    kubectl create -f jenkins-pv-volume.yaml  
    kubectl create -f jenkins-pv-claim.yaml

4- Create Kubernetes Deployment.

    kubectl create -f deployment.yaml

5- Create Kubernetes Service.

    kubectl create -f service.yaml

After this operation, Jenkins Master will be available inside K8S cluster using the DNS Address jenkins.ci-cd:8080 also, slaves will be able to connect to Jenkins using the address jenkins.ci-cd:50000.

## Known issues ##

For know issues check the page: https://github.com/jnonino/jenkins-kubernetes/issues.
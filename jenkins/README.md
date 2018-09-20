# Jenkins #

This project deploys Jenkins on a Kubernetes cluster.

## Deploying Jenkins on Minikube ##

In this section I will show the commands to deploy Jenkins on Kubernetes.

1- Create ConfigMap with required environment variables. Here you can set required environment variables that need to be set on the container. Currently is an unused feature.  

    kubectl create -f environment-variables.yaml  

2- Create Kubernetes Service.

    kubectl create -f service.yaml

3- Create Kubernetes Persistent Volumne and Claim in order to persist data in Jenkins.

    kubectl create -f pv-volume.yaml  
    kubectl create -f pv-claim.yaml

4- Create Kubernetes Deployment.

    kubectl create -f deployment.yaml

After this operation, Jenkins Master will be available inside K8S cluster using the DNS Address jenkins.ci-cd:8080 also, slaves will be able to connect to Jenkins using the address jenkins.ci-cd:50000.
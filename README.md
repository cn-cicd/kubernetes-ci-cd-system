# CI-CD system on Kubernetes #

[![](https://img.shields.io/github/license/jnonino/kubernetes-ci-cd-system)](https://github.com/jnonino/kubernetes-ci-cd-system)
[![](https://img.shields.io/github/issues/jnonino/kubernetes-ci-cd-system)](https://github.com/jnonino/kubernetes-ci-cd-system)
[![](https://img.shields.io/github/issues-closed/jnonino/kubernetes-ci-cd-system)](https://github.com/jnonino/kubernetes-ci-cd-system)
[![](https://img.shields.io/github/languages/code-size/jnonino/kubernetes-ci-cd-system)](https://github.com/jnonino/kubernetes-ci-cd-system)
[![](https://img.shields.io/github/repo-size/jnonino/kubernetes-ci-cd-system)](https://github.com/jnonino/kubernetes-ci-cd-system)

Test Continuous Integration/Delivery environment on Kubernetes (minikube).

## Requirements ##

Install and configure Minikube. Follow the instructions in Kubernetes documentation.

    https://kubernetes.io/docs/getting-started-guides/minikube/

Install kubectl to control the Kubernetes cluster, follow instructions here:

    https://kubernetes.io/docs/tasks/tools/install-kubectl/
    https://kubernetes.io/docs/reference/kubectl/overview/

## Start Minikube cluster ##

Run command to start minikube cluster on a VM using 2 CPUs and 8 Gb of RAM.

    minikube start --cpus 2 --memory 8192

## Kubernetes on Docker for Windows ##

Docker official documentation: Getting Started on Docker for Windows.

    https://docs.docker.com/docker-for-windows/

Docker official documentation: Deploy on Kubernetes.

    https://docs.docker.com/docker-for-windows/kubernetes/

Enable Kubernetes Dashboard.

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta1/aio/deploy/recommended.yaml
    kubectl proxy

Dashboard accessible at:

    http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

## Kubernetes Namespace ##

Create a Kubernetes namespace where all Kubernetes resources will be located.

    kubectl create -f namespace.yaml

## Jenkins ##

Jenkins is an open source automation server written in Java. Jenkins helps to automate the non-human part of the software development process, with continuous integration and facilitating technical aspects of continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat. It supports version control tools and can execute Apache Ant, Apache Maven and sbt based projects as well as arbitrary shell scripts and Windows batch commands. The creator of Jenkins is Kohsuke Kawaguchi. Released under the MIT License, Jenkins is free software. [Paragraph extracted from Wikipedia]

If using minikube. mount a local storage volume to persist Jenkins data:

    mkdir -p tmp/jenkins-pv-volume
    chmod 777 tmp/jenkins-pv-volume
    minikube mount tmp/jenkins-pv-volume:/data/jenkins-pv-volume

To deploy Jenkins run these commands:
    
    kubectl create -f jenkins/

Start Jenkins UI:

    minikube service jenkins -n cicd --url

## SonarQube ##

SonarQube is an open source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on more than 20 programming languages. SonarQube offers reports on duplicated code, coding standards, unit tests, code coverage, code complexity, comments, bugs, and security vulnerabilities. SonarQube can record metrics history and provides evolution graphs. [Paragraph extracted from Wikipedia]

To deploy Sonarqube run these commands:

    kubectl create -f sonarqube/

## Artifactory ##

To deploy Artifactory run these commands:

    kubectl create -f artifactory/

## Nexus ##

To deploy Nexus run these commands:

    kubectl create -f nexus/

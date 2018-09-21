# CI-CD system on Kubernetes #

Test Continuous Integration/Delivery environment on Kubernetes (minikube).

## Requirements ##

Install and configure Minikube. Follow the instructions in Kubernetes documentation.

    https://kubernetes.io/docs/getting-started-guides/minikube/

Install kubectl to control the Kubernetes cluster, follow instructions here:

    https://kubernetes.io/docs/tasks/tools/install-kubectl/
    https://kubernetes.io/docs/reference/kubectl/overview/

## Kubernetes Namespace ##

Create a Kubernetes namespace where all Kubernetes resources will be located.

    kubectl create -f namespace.yaml

## Jenkins ##

Jenkins is an open source automation server written in Java. Jenkins helps to automate the non-human part of the software development process, with continuous integration and facilitating technical aspects of continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat. It supports version control tools and can execute Apache Ant, Apache Maven and sbt based projects as well as arbitrary shell scripts and Windows batch commands. The creator of Jenkins is Kohsuke Kawaguchi. Released under the MIT License, Jenkins is free software. [Paragraph extracted from Wikipedia]

To deploy Jenkins run these commands:

    mkdir -p /tmp/jenkins-pv-volume
    chmod 777 /tmp/jenkins-pv-volume
    minikube mount /tmp/jenkins-pv-volume:/data/jenkins-pv-volume
    kubectl create -f jenkins/

Start Jenkins UI:

    minikube service jenkins -n ci-cd

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
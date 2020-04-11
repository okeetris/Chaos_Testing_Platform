# Performance testing cluster hosted on OpenShift

## Overview
This repo contains the shell scripts and deployment's to create and run a Performance testing cluster on Openshift and can be easily adapted to also work with all Kubernetes enviroments.

It will create:
- 1 JMeter master pod
- 5 JMeter slave pods
- 1 InfluxDb pod for storing all test data
- 1 Grafana pod for displaying the results of the ran tests in real time.

It will also link all pods together to provide a fully working test platform
### Preqresites

Kubernetes > 1.11

OpenShift version > 3.11

N.B.: this implementation was tested on Kubernetes 1.11 and OpenShift 3.11

### Installation

Open the OpenShift folder and follow the instructions in the ReadMe there.

#### In Progress

Kuberenetes version.

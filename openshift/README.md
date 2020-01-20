# Jmeter Cluster Support for Kubernetes and OpenShift

## Prerequisits

Kubernetes > 1.8

OpenShift version > 3.5

N.B.: this implementation was tested on Kubernetes 1.9, 1.10, and 1.11 and OpenShift 3.5 and 3.10 (minishift)

## TL;DR

./dashboard.sh

oc expose svc/<service name>

./start_test.sh


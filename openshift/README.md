# Jmeter Cluster Support for Kubernetes and OpenShift

## Prerequisits

Kubernetes > 1.11

OpenShift version > 3.11

N.B.: this implementation was tested on Kubernetes 1.11 and OpenShift 3.11

## TL;DR

### Create InfluxDB and build grafana dashboard
```
./dashboard.sh
```
### Expose Grafana service
```
oc expose svc/<grafana service name>
```
### start JMeter test script
```
./start_test.sh
```


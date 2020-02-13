# Jmeter Cluster Support for Kubernetes and OpenShift

## Prerequisits

Kubernetes > 1.11

OpenShift version > 3.11

N.B.: this implementation was tested on Kubernetes 1.11 and OpenShift 3.11

## TL;DR

### Make shell scripts executable
```
chmod +x jmeter_cluster_create.sh dashboard.sh start_test.sh copy_test.sh jmeter_stop.sh
```

### Create cluster
```
./jmeter_cluster_create.sh
```

### Create InfluxDB and build grafana dashboard
```
./dashboard.sh
```
### Check the grafana service to see if it has been exposed
```
oc get services
```
### Expose Grafana service (If not exposed yet)
```
oc expose svc/<grafana service name>
```
### start JMeter test script
```
./start_test.sh
```


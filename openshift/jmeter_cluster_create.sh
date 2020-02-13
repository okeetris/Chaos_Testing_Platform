#!/usr/bin/env bash
#Create multiple Jmeter namespaces on an existing kuberntes cluster
#Started On January 23, 2018

working_dir=`pwd`

echo "checking if oc is present"

if ! hash oc 2>/dev/null
then
    echo "'oc' was not found in PATH"
    echo "Ensure that you can acces an existing OpenShift cluster via oc"
    exit
fi

oc version


echo "Creating Jmeter slave nodes"

# nodes=`kubectl get no | egrep -v "master|NAME" | wc -l`

# echo

# echo "Number of worker nodes on this cluster is " $nodes

echo

#echo "Creating $nodes Jmeter slave replicas and service"

echo

oc create -f $working_dir/jmeter_slaves_deploymentconfig.yaml

oc create -f $working_dir/jmeter_slaves_svc.yaml

echo "Creating Jmeter Master"

oc create -f $working_dir/jmeter_master_configmap.yaml

oc create -f $working_dir/jmeter_master_deploymentconfig.yaml


echo "Creating Influxdb and the service"

oc create -f $working_dir/jmeter_influxdb_configmap.yaml

oc create -f $working_dir/jmeter_influxdb_openshift_deploymentconfig_ephemeral.yaml

oc create -f $working_dir/jmeter_influxdb_svc.yaml

echo "Creating Grafana Deployment"

oc create -f $working_dir/jmeter_grafana_deploy.yaml

oc create -f $working_dir/jmeter_grafana_svc.yaml


echo

oc get all -o wide

echo project= jmeter > $working_dir/tenant_export

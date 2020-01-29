#!/usr/bin/env bash
#Script writtent to stop a running jmeter master test
#Kindly ensure you have the necessary kubeconfig

working_dir=`pwd`

#Get namesapce variable
tenant=`awk '{print $NF}' $working_dir/tenant_export`

master_pod=`kubectl get pod | grep jmeter-master | awk '{print $1}'`

read -p 'Enter path to the jmx file ' jmx

if [ ! -f "$jmx" ];
then
    echo "Test script file was not found in PATH"
    echo "Kindly check and input the correct file path"
    exit
fi

oc exec -ti $master_pod -- /bin/bash /jmeter/apache-jmeter-5.0/bin/stoptest.sh

oc exec -ti $master_pod -- /bin/bash /jmeter/apache-jmeter-5.0/bin/shutdown.sh


oc delete deploymentconfig.apps.openshift.io/jmeter-slaves

oc create -f $working_dir/jmeter_slaves_deploymentconfig.yaml

#oc create -f $working_dir/jmeter_slaves_svc.yaml
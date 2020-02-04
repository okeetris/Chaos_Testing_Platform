working_dir=`pwd`

#Get namesapce variable
tenant=`awk '{print $NF}' $working_dir/tenant_export`

read -p 'Enter path to the jmx file ' jmx

if [ ! -f "$jmx" ];
then
    echo "Test script file was not found in PATH"
    echo "Kindly check and input the correct file path"
    exit
fi

#Get Master pod details


master_pod=`oc get pod  | grep jmeter-master | awk '{print $1}'`

echo master_pod

# kubectl cp $jmx -n $tenant $master_pod:/$jmx

#oc cp $jmx $master_pod:/$jmx

oc cp $jmx $master_pod:/jmeter/$jmx

echo "$jmx copied over"

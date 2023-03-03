#!/bin/bash

####################################################
# Functions
####################################################

repeat() {
    echo
    for i in {1..120}; do
        echo -n "$1"
    done
    echo
}

enable_user_workload_monitoring()
{
    echo
    echo "Enabling monitoring for user-defined projects..."
    echo

    oc apply -f ../manifest/cluster-monitoring-config.yml -n openshift-monitoring
}

install_operator() {
    operatorNameParam=$1
    operatorDescParam=$2
    ymlFilePathParam=$3
    project=$4

    echo
    echo "Installing $operatorDescParam to $project project..."
    echo

    oc apply -f $ymlFilePathParam -n $project

    echo
    echo "Waiting for $operatorDescParam to be available..."
    echo

    available="False"

    while [[ $available != "True" ]]; do
        sleep 5
        available=$(oc get -n $project operators.operators.coreos.com \
            $operatorNameParam.$project \
            -o jsonpath='{.status.components.refs[?(@.apiVersion=="apps/v1")].conditions[?(@.type=="Available")].status}')
    done

    echo "$operatorDescParam is now available!"
}

install_distributed_tracing_platform() {
    project=openshift-operators

    operatorName=jaeger-product
    operatorDesc="Red Hat OpenShift distributed tracing platform"
    ymlFilePath=../manifest/distributed-tracing-platform-subscription.yml

    install_operator $operatorName "$operatorDesc" $ymlFilePath $project
}

install_distributed_tracing_data_collection() {
    operatorName=opentelemetry-product
    operatorDesc="Red Hat OpenShift distributed tracing data collection"
    ymlFilePath=../manifest/distributed-tracing-data-collection-subscription.yml
    project=openshift-operators

    install_operator $operatorName "$operatorDesc" $ymlFilePath $project
}

install_web_terminal() {
    operatorName=web-terminal
    operatorDesc="Web Terminal"
    ymlFilePath=../manifest/web-terminal-subscription.yml
    project=openshift-operators

    install_operator $operatorName "$operatorDesc" $ymlFilePath $project
}

install_openshift_elasticsearch() {
    operatorName=elasticsearch-operator
    operatorDesc="OpenShift Elasticsearch Operator"
    ymlFilePath=../manifest/openshift-elasticsearch-subscription.yml
    project=openshift-operators

    install_operator $operatorName "$operatorDesc" $ymlFilePath $project
}

install_openshift_logging() {
    operatorName=cluster-logging
    operatorDesc="Red Hat OpenShift Logging"
    ymlFilePath=../manifest/openshift-logging-subscription.yml
    project=openshift-logging

    install_operator $operatorName "$operatorDesc" $ymlFilePath $project
}



####################################################
# Main (Entry point)
####################################################
echo
echo "OpenShift Workshop For Developers Provisioner"
repeat '-'

enable_user_workload_monitoring
repeat '-'

install_distributed_tracing_platform
repeat '-'

install_distributed_tracing_data_collection
repeat '-'

install_web_terminal
repeat '-'

install_openshift_elasticsearch
repeat '-'

install_openshift_logging
repeat '-'

oc project default

echo "Done!!!"

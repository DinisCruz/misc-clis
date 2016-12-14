#!/usr/bin/env bash

# this are the main APIs

function dk-about {
    echo "Created by Dinis Cruz, source code hosted at https://github.com/DinisCruz/kubernetes-cli"
}



function dk-delete {
    local name=$1
    kubectl delete deployment $name
}

function dk-deployments {
    echo
    kubectl get deployments
    echo
}


function dk-deployment-delete {
    local name=$1
    kubectl delete deployment $name
}
function dk-deployment-expose-internet {
    local name=$1
    local port=$2
    kubectl expose deployment $name --port $port --type=LoadBalancer
}

function dk-deployment-expose-local {
    local name=$1
    local port=$2
    kubectl expose deployment $name --port $port
}

function dk-kubectl {
    kubectl $1 $2 $3 $4
}

function dk-logs {
    local fullname=$(dk-pods-full-name $1)
    kubectl logs $fullname
}

function dk-pods {
    echo
    kubectl get pods
    echo
}

function dk-pods-full-name {
    local name=$1
    echo "$(dk-pods-names)" | grep "$name"
}

function dk-pods-names {
    kubectl get pods | awk 'NR > 1 {print $1}'
}

function dk-pod-port {
    local fullname=$(dk-pods-full-name $1)
    kubectl get pods $fullname --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
}

function dk-port-forward {
    local fullname=$(dk-pods-full-name $1)
    local local_port=$2
    local container_port=$3
    kubectl port-forward $fullname $local_port:$container_port

}
function dk-run {
    local name=$1
    local image=$2
    local port=$3
    kubectl run $1 --image=$image --port=$port
}

function dk-services {
    kubectl get services
}

function dk-service-delete {
    local name=$1
    kubectl delete service $name
}



function dk-ssh {
    local fullname=$(dk-pods-full-name $1)
    kubectl exec -it $fullname bash
}

function dk-ui {
    open "http://localhost:8001/ui"
}


# other alias


function deployments        {   dk-deployments $1           ; }
function dk-port            {   dk-pod-port    $1           ; }
function logs               {   dk-logs        $1           ; }
function pods               {   dk-pods                     ; }
function services           {   dk-services                 ; }

function delete-service     {   dk-service-delete $1        ; }
function delete-deployment  {   dk-deployment-delete $1     ; }
#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/istio-manifests.yaml
kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/kubernetes-manifests.yaml

#kubectl delete ns istio-system

#kubectl delete clusterrolebinding cluster-admin-binding

#kubectl delete -f ../auto-mtls/
#kubectl delete -f ../jwt

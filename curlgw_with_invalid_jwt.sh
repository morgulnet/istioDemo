#!/bin/bash

GWIP=$(kubectl get -n istio-system service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}'); TOKEN=megan; curl --head --header "Authorization: Bearer $TOKEN" $GWIP

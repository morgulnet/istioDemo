#!/bin/bash

GWIP=$(kubectl get -n istio-system service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}'); TOKEN=$(curl https://raw.githubusercontent.com/istio/istio/release-1.5/security/tools/jwt/samples/demo.jwt -s); curl --head --header "Authorization: Bearer $TOKEN" $GWIP


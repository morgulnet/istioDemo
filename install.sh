#!/bin/bash

# https://istio.io/docs/setup/install/istioctl/

# Download Istio
WORKDIR="`pwd`"
ISTIO_VERSION="${ISTIO_VERSION:-1.6.0}"
echo "Downloading Istio ${ISTIO_VERSION}..."
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=$ISTIO_VERSION sh -

export PATH="$PATH:/${WORKDIR}/istio-${ISTIO_VERSION}/bin"

# Am I ready for install?
istioctl verify-install

# Prepare for install
kubectl create namespace istio-system

kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)

istioctl manifest apply \
--set values.grafana.enabled=true \
--set values.kiali.enabled=true \
--set values.tracing.enabled=true \
--set values.kiali.enabled=true --set values.kiali.createDemoSecret=true \
--set values.global.proxy.accessLogFile="/dev/stdout"


# Deploy app
kubectl label namespace default istio-injection=enabled
#kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/istio-manifests.yaml
#kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/kubernetes-manifests.yaml
#kubectl delete serviceentry whitelist-egress-google-metadata
#kubectl delete serviceentry whitelist-egress-googleapis
#kubectl delete svc frontend-external

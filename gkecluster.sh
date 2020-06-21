#!/bin/bash
gcloud container clusters create \
  --machine-type n1-standard-2 \
  --num-nodes 4 \
  --zone europe-west4-a \
  --cluster-version latest \
  standart-cluster-1

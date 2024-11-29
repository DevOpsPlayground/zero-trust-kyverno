#!/bin/bash

kubectl apply -f robot-shop.yaml

kubectl get po -n robot-shop
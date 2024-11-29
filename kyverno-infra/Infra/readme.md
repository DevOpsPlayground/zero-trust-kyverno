# How to deploy kyverno infrastructure

Ensure that the AKS cluster is ready, see instructions on how to deploy the AKS cluster

Change directory to the kyverno-infra directory
 cd kyverno-infra/infra

### To configure kyverno in the AKS cluster, run the script
```bash
./install-kyverno.sh
```

### To confirm that all the clusters are started in kyverno namespace
run 
```
Kubectl get po -n kyverno
```

## Next deploy ecommerce application (robot-shop)

run the script
```
chmod +x install-robot-shop.sh

./install-robot-shop.sh
```
## To ensure that all the pods are started 
run the script
```bash
kubectl get po -n robot-shop
```

### Ingress Test:

The script will provision an application gateway with a public IP address

To confirm that your application is working properly
 Run the following command
 ```
 chmod +x launch-website.sh 

 ./launch-website.sh 
```
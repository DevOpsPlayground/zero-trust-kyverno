
# Mutate Workshop

### Description
Policy: Policy to add default resource requests to containers within a Pod if they are not specified.

This policy ensures a default resource is added to the requests to containers within a Pod if they are not specified.

### Steps to Apply These Policies
Ensure you are in the workshop directory and lesson2-mutate subdirectory

To apply the Policies: Use kubectl to apply the policies:

Run the following command
```
kubectl apply -f mutate.yaml

```

Test the Policies:

Try creating resources from the provided manifest.
Verify that violations are denied and conforming resources are allowed.
View Logs: Check Kyverno logs for additional information:

```
kubectl logs -n kyverno -l app.kubernetes.io/component=reports-controller
```

To reset
Run

```
kubectl rollout restart deployment -n robot-shop
```

```
kubectl get pods -n kyverno
```
# Validate Namespace Workshop

### Description
Policy: Ensure Namespace Exists

This policy ensures that resources are only created in the robot-shop namespace.

### Steps to Apply These Policies
Ensure you are in the workshop directory and validate/lesson01 subdirectory
Save or verify that policy validate-namespace.yaml exist: 

To apply the Policies: Use kubectl to apply the policies:

Run the following command
```
kubectl apply -f validate-namespace.yaml

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
# Validate Namespace Workshop

### Description
Policy: Restrict images with latest tags

This policy ensures that This policy validates that the image specifies a tag and that it is not called `latest`..

### Steps to Apply These Policies
Ensure you are in the workshop directory and lesson2 subdirectory

To apply the Policies: Use kubectl to apply the policies:

Run the following command
```
kubectl apply -f restrict-latest-tag.yaml

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

## Lesson 1 -  Cluster level Policy

### Workshop: Enforcing Namespace Restrictions with Kyverno
In this workshop, participants will learn how to create, test, and enforce a Kyverno policy to prevent Pods from being deployed in specific namespaces (e.g., kube-system).

Aims of the workshop
 - Prevent Pods from being deployed in specific namespaces (e.g., kube-system).
 - Prevent critical namespaces like kube-system from being polluted with unnecessary or insecure Pods.
 - Match Pods in the kube-system namespace.
 - Deny their creation with a clear error message.

 To test the policy using Kyverno Play ground

 Open https://playground.kyverno.io

 Copy and paste the content in test-pod.yml to Resources section in the Kyverno playground
 Copy and paste the content in Kyverno/policy/deny-pod-kube-system.yml to Policies section in the Kyverno playground
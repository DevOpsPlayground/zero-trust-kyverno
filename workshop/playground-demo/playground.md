
#  Validation Policy Demo

## Writing Policies & Rules -  Cluster level Policy Definition

### Workshop: Enforcing Namespace Restrictions with Kyverno
In this workshop, participants will learn how to create, test, and enforce a Kyverno policies for example:
How to write a policy to prevent Pods from being deployed in specific namespaces (e.g., kube-system).

### Aims of the workshop
Hands on experience writing Kyverno policies
 - Prevent Pods from being deployed in specific namespaces (e.g., kube-system).
 - Prevent critical namespaces like kube-system from being polluted with unnecessary or insecure Pods.
 - Match Pods in the kube-system namespace.
 - Deny their creation with a clear error message.

 To test the policy using Kyverno Play ground

 Open https://playground.kyverno.io


### Playground Demo 01

In this demo we will walk through how to write a kyverno clusterpolicy to deny pods without the label "app.kubernetes.io/name" from being deployed

Open the following link and navigate to the playground
https://tinyurl.com/3tp87bn7

 
#### Demo 01 Exercise:
Fix the error in the following clusterpolicy to ensure that the rule applies to the pci namespace
Open link to playground
https://tinyurl.com/43x5pu5d

### Playground Demo 02
Using JAMESPATH and Conditions to define variables
Open link to playground
https://tinyurl.com/2ufcwwxf



### Playground - Demo 03
Deny or Restric access if containers are of type nginx or istio using for each Statement
Open link to playground
https://tinyurl.com/4bddbwyx



### Playground - Demo 04
Live Demo: Verifying images size and capacity
Open link to playground
https://tinyurl.com/yc2za5te


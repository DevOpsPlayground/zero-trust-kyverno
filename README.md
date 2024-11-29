# How to Learn Kyverno Policy Definition

Kyverno is a Kubernetes-native policy engine that allows you to define, validate, and enforce policies for Kubernetes clusters. Here's a step-by-step guide to learning how to define Kyverno policies:


# Workshop Agenda
- Introduction to the Problem.
- Understanding the Policy.
- Creating the Policy.
- Testing the Policy Locally.
- Applying the Policy in a Kubernetes Cluster.
- Validating Policy Enforcement.

There are 3 different lessons in the workshop folder defining each policy definition
To start go to the workshop folder and follow the instructions for each lesson

# Top Use Cases for Kyverno

Kyverno stands out for its versatility, with its primary use cases being **validation**, **mutation**, and **generation**. Let’s delve into each of these in detail.

## 1. Validation
Validation is Kyverno's most straightforward use case. It categorizes resources as either **compliant** or **non-compliant**:

- **Compliant resources**: Allowed to proceed to deployment.
- **Non-compliant resources**: Blocked from entering the cluster.

This ensures that all resources adhere to predefined policies before being admitted.

## 2. Mutation
Mutation empowers Kyverno to **dynamically alter resources** before they are accepted into the cluster. This feature is particularly valuable for:

- Adding or modifying **labels**.
- Updating **annotations**.
- Adjusting other **configurations** automatically.

By handling these changes dynamically, Kyverno simplifies resource management and enforces consistency.

## 3. Generation
The **generation** feature in Kyverno is highly versatile, enabling the **dynamic creation of Kubernetes resources**. Common use cases include:

- **Cloning secrets** across namespaces.
- Automating the creation of dependent resources.

This capability streamlines workflows by reducing manual intervention and ensuring resource availability across the cluster.

Kyverno’s flexible approach to managing Kubernetes resources makes it an indispensable tool for modern cloud-native environments.


# Validation: Enforcing Compliance

Validation is one of Kyverno’s core features, enabling you to enforce policies that define which resources are allowed in your cluster. It operates as a **binary decision mechanism**—either a resource complies and is allowed, or it doesn’t and is rejected.

For example, validation policies can enforce Kubernetes Pod Security Standards, ensuring compliance and security.

---

## Lesson 01
## Validation Policy Example

### Objective
Create a validation policy that ensures that a Deployment named web exists in the robot-shop namespace. If it doesn't, the policy will prevent further resource creation or modification until the condition is met.

Navigate to the workshop folder and Open the file check-web-deployment.yaml in the lesson 1 folder.

Run the following command to create the policy:
kubectl apply -f workshop/lesson01/check-web-deployment.yaml 

Next: Deploy the workload using the following command
kubectl apply -f kyverno-infra/infra/robot-shop.yaml


# Lesson 2



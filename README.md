# ensf400-lab8-kubernetes-2

## Objectives
This lab will teach us the scheduling, configmaps, canary and blue-green deployment strategies of Kubernetes. Through Minikube, a simplified Kubernetes engine running on a single computer, we practice the key concepts and usage of Kubernetes.

## Environment

### Set Up Your GitHub CodeSpaces Instance

Same as Lab 6, this lab will be performed in [GitHub CodeSpaces](https://github.com/codespaces). Create an instance using GitHub Codespaces. Choose repository `denoslab/ensf400-lab8-kubernetes-2`.


```bash
$ minikube start --nodes 3 -p ensf400
```

This step will start the Minikube service with 3 virtual nodes, stored in a profile called `ensf400`. If for some reason your Codespaces instance was stopped (e.g., not using it for a while). You can restart the minikube service using this profile by running:

```bash
$ minikube start -p ensf400
```

## Steps

Go to Section 7 - 10 and complete the steps for each section. The steps can be found in the `README.md` files in each subdirectory.

## Have Your Work Checked By a TA

The TA will check the completion of the following tasks:

- Output of Section 7.
- Output of Section 8.
- Output of Section 9.
- Output of Section 10.


Each member of the group should be able to answer all of the following questions. The TA will ask each person one question selected at random, and the student must be able to answer the question to get credit for the lab.

- Q1: Explain the scheduling strategy of Node Affinity and the scenarios to use it.

allows you to constrain which nodes your pod is eligible to be scheduled on, based on labels on the node
can be hard or soft, required or preferred
if you have nodes with special hardware or certain labels that make them suitable for running particular workloads

- Q2: Explain the scheduling strategy of Pod Anti-Affinity and the scenarios to use it.

ensuring certain pods don’t run on the same node as other pods.
If we need to prevent single point of failure, we would like nodes to be on diff pods.

- Q3: Explain the deployment strategy of blue-green deployment. How to switch between the two versions of deployments?

Allow updating one version named as BLUE while the another version named as GREEN will keep serving the request once done we can switch back to BLUE if required.
kubectl patch service  SERVICENAME -p '{"spec":{"selector":{"KEY": "VALUE"}}}'

- Q4: Explain the deployment strategy of canary deployment. How to adjust the ratio of users getting serviced by the canary deployment?

It is to allow the new version of the app to run parallel and so some request will be allowed to be passed into the new one so the new version can be tested and observed.

annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "20"

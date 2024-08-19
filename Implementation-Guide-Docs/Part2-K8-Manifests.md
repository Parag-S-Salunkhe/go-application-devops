## Creating K8 Mainifests

Create 3 yaml files - deployment, service and ingress (ingress resource - needed for ingress controller) 
[K8s-Manifests](https://github.com/Parag-S-Salunkhe/go-application-devops/tree/main/k8s/manifests)

## Pre-requisites

Installing AWS CLI. Kubectl and EKSCTL

[Installation guide](https://github.com/LondheShubham153/kubestarter/blob/main/eks_cluster_setup.md)

## K8s 

Creating  EKS cluster - takes around 10 minutes to create. apply all manifests
```shell
eksctl create cluster --name cluster-name --region region
kubectl apply deployment.yaml # same for service.yaml and ingress.yaml
```

Check ingress resource - kubectl get ing , you can notice there is no address assignes, thats why we need an ingress controller - it will assign adress and map it to domain in etc/host

Service has been assigned clusterIP - which can't be accessed from outside the cluster, so we edit it to Nodeport
```shell
kubectl edit svc service-name
```
scroll down where you see 'type: ClusterIP' change it to 'NodePort' - case sensitive!

'kubectl get svc' our service will be of type NodePort and is assigned port example 80/32002 , we can access the service on Node IP with port 32002

```shell
kubectl get nodes -o wide
```
you will see the ips, choose any one (external ip), go to browser : ip:32002/courses . If the application is accesed  we know its working on K8s (not accessed through nginx). Change security groups to allow traffic.

---------------------------------------------------------------------

## Questionaire - [Answers](Questions&Answers.md#p2)

1. What is EXTERNAL_IP & INTERNAL_IP  when we run command kubectl get nodes -o wide?

2. What is differnce in ClusterIP , NodePort and LoadBalancer? Why are we not using LoadBalancer type?


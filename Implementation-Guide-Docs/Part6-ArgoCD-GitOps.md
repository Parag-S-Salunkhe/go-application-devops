# Install Argo CD

## Install Argo CD using manifests

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Access the Argo CD UI (Loadbalancer service) 

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
## Access the Argo CD UI (Loadbalancer service) -For Windows

```bash
kubectl patch svc argocd-server -n argocd -p '{\"spec\": {\"type\": \"LoadBalancer\"}}'
```

## Get the Loadbalancer service IP

```bash
kubectl get svc argocd-server
```

to set password on argo ui run
```
kubectl get secrets -n argocd
kubectl edit secrets argocd-initial-admin-secret -n argocd
```

decode the base64 encoded password and sign in.

sync policy set as automatic and self heal. insert all other configurations . argo cd starts deploying deployment , service and ingress.

Argo will pull values from helm chart when CI is completedand update any changes made

![ArgoUI](../static/images/argoCD.png)

## Nginx ingress & Nginx Controller

there are 2 types of niginx controller, one is by F5 and other is on github - community driven.

installing nginx-controller. [documentation](https://kubernetes.github.io/ingress-nginx/deploy/#aws)
```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.2/deploy/static/provider/aws/deploy.yaml
```
Ingress Controller- 
Nginx controlles watches ingress resource (manifest) and creates Network load balancer on AWS, thats it. Controllers are mostly written on go program, they will forward request to service 
and service forwards it to pod. 

```shell
kubectl get pods -n ingress-controller # to see nginx pods
kubectl edit pod ingress...controler... -n ingress-nginx
```

in Ingress manifest we have descrives ingress class name as 'nginx' thats how ingress controller watches ingress resource.

'kubectl get ing' now in address you can see a domain and ip is there

When the NLB is created we get a domain name also has IP -LB is type Network

Can we access the application on NLB ? NO, because in our ingress manifest we have describe that to access the app go to 'go-web-app-local'. in realtime corporate we have existing domains.

we have to map the ip locally 
```shell
nslookup LB-ip  #returns 2 or 3 ips , copy any ip
sudo vim etc/hosts # add the ip here
```

now you can access the application on the path 'go-web-app.local/home'

----------------------------------------------------------------------------

Questions - [Answers](Questions&Answers.md#p3)

1. How does SSL/TLS termination work with an Ingress Controller, and can I configure it for different services?
2. What are the best practices for scaling an Ingress Controller in a large Kubernetes deployment?
3. How do readiness and liveness probes interact with Ingress Controllers in Kubernetes?
4. What are some common performance bottlenecks when using Ingress Controllers in production?
5. How do I secure my Ingress resources and Ingress Controllers against potential vulnerabilities or attacks?

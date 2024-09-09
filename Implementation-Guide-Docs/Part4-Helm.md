## Helm Installation

follow [helm guide](https://github.com/Parag-S-Salunkhe/twotierapp/blob/main/docs/Part4-helm.md) for installation and other commands

create chart -> delete char dir -> delete files in tempelate -> copy manifests to tempelate 

in deployments change img tag  from parag2608/repo:v1 to parag2608/repo:{{ Values.image.tag}} , this helps us dynamically update images after CI CD has been run.

update values.yaml to what it is now. 

```shell
helm install <release-name> <chart-directory>
kubectl get all
```

we make a change to deployment file as well. you can access the previous commits to see that the tage for conatiner was static/hardcoded. We use Jinja2 tempelating, we update the values yaml file, and 
then deployment file will access the container tag from values yaml file , where our tag for container gets updated on successful ci cd and the latest container is pushed to docker hub.

all the manifest are deployed and app is also running.

getting all services down
```shell
helm unistall 
```
---------------------------------------------------------------------------------------------------
## Questions - [Answers](Questions&Answers.md#p4)

1. What is Helm, and how does it help with Kubernetes deployments?
2. How do Helm charts handle versioning, and how can we manage different environments (e.g., dev, prod) using the same chart?
3. What are some common challenges or pitfalls to watch out for when using Helm in production environments?
4. How do Helm rollbacks work, and are there any limitations or risks associated with them?
5. Why would you use helm for rollback if you have github?

   




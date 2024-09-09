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
## Questionaire 




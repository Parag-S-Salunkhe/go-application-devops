## Helm Installation

follow [helm guide](https://github.com/Parag-S-Salunkhe/twotierapp/blob/main/docs/Part4-helm.md) for installation and other commands

create chart -> delete char dir -> delete files in tempelate -> copy manifests to tempelate 

in deployments change img tag  from parag2608/repo:v1 to parag2608/repo:{{ Values.image.tag}} , this helps us dynamically update images after CI CD has been run.

update values.yaml to what it is now. 

```shell
helm install <release-name> <chart-directory>
kubectl get all
```

all the manifest are deployed and app is also running.

getting all services down
```shell
helm unistall 
```
---------------------------------------------------------------------------------------------------
## Questionaire 




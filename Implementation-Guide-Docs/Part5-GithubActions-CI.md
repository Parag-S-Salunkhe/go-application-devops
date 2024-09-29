## GitHub Action Continuous Integration

follow [ CI workflow file]{https://github.com/Parag-S-Salunkhe/go-application-devops/blob/main/.github/workflows/ci.yaml} for detailed info 

runners - there are 2 types,  self hosted (pay to use) and github hosted runners (free upto a limit) .  runners are like VMs

in Github Actions the way you write an action -
```
job name
  runs-on: choose runner

  steps:
  -  name:
     uses:
```

------------------------------------------------------------------

## Questions - [Answers](Questions&Answers.md#p4)

1. After each stage what happens to runner and why?
   

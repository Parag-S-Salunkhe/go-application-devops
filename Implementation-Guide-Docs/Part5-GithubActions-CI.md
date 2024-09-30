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

𝗞𝗲𝘆 𝗖𝗼𝗺𝗽𝗼𝗻𝗲𝗻𝘁𝘀 𝗼𝗳 𝗮 𝗖𝗜 𝗪𝗼𝗿𝗸𝗳𝗹𝗼𝘄:
𝗧𝗿𝗶𝗴𝗴𝗲𝗿𝘀: CI workflows can be triggered by events like pushes to the main branch or pull requests.
𝗝𝗼𝗯𝘀: Defined tasks that run in parallel or sequentially. Each job runs in a fresh instance of the runner environment.
𝗦𝘁𝗲𝗽𝘀: Individual tasks within a job. These can include actions from the marketplace or shell commands.

Jobs in GitHub Actions Workflow for this project -

𝗟𝗶𝗻𝘁 𝗝𝗼𝗯 - Ensure code quality and adherence to standards.
𝗕𝘂𝗶𝗹𝗱 𝗝𝗼𝗯 - Compile the application and create a Docker image.
𝗣𝘂𝘀𝗵 𝗝𝗼𝗯 - Build and push the Docker image to Docker Hub.
𝗨𝗽𝗱𝗮𝘁𝗲 𝗛𝗲𝗹𝗺 𝗖𝗵𝗮𝗿𝘁 𝗩𝗮𝗹𝘂𝗲𝘀 - Update the Helm chart with the new Docker image tag

------------------------------------------------------------------

## Questions - [Answers](Questions&Answers.md#p4)

1. After each stage what happens to runner and why?
   

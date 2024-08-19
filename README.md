![Static Badge](https://img.shields.io/badge/Docker-black?logo=Docker&logoColor=%232496ED) ![Static Badge](https://img.shields.io/badge/Kubernetes-black?logo=Kubernetes&logoColor=%23326CE5)
![Static Badge](https://img.shields.io/badge/EKS-black?logo=Amazon%20EKS&logoColor=%23FF9900) ![Static Badge](https://img.shields.io/badge/Helm-white?logo=helm&logoColor=%230F1689)
![Static Badge](https://img.shields.io/badge/Nginx-black?logo=Nginx&logoColor=%23009639) ![Static Badge](https://img.shields.io/badge/Github%20Actions-black?logo=githubactions&logoColor=%232088FF)
![Static Badge](https://img.shields.io/badge/Argo-black?logo=argo&logoColor=%23EF7B4D)



# DevOps implementation on - Go Web Application

My motive of this project is to do implementation of DevOps. its a simple stateless web application.

In the guide every details are mentioned, also attached a doc where any questions related to project that I have faced-

Check here for [Implentation Guide](./Implementation-Guide-Docs), Questions and Troubleshooting

[Part 1](./Implementation-Guide-Docs/Part1-Checks-&-Docker.md): Containerization using Docker & using Multi Stage Docker

[Part 2](./Implementation-Guide-Docs/Part2-K8-Manifests.md): Writing K8 Manifests for svc, deployment and ingress

[Part 3](./Implementation-Guide-Docs/Part3-Ingress&NginxController.md): Implementing ingress and Ingress controller (nginx)

[Part 4](./Implementation-Guide-Docs/Part4-Helm.md): Implenting using Helm

[Part 5](./Implementation-Guide-Docs/Part5-GithubActions-CI.md): Github Actions to make CI

[Part 6](./Implementation-Guide-Docs/Part6-ArgoCD-GitOps.md): ArgoCD for GitOps

Note:Implementation ok EKS can become costly if you take time to finish the project, depending on region there are 2 or 3 managed instances of control plane running in the background, each day its will cost around 5$ - 10$ depending how many worker instances are spin up and instance type. 

# Go Web Application

This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

Clone the base application- [Project](https://github.com/iam-veeramalla/go-web-app)

## Running the server

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/courses` in your web browser.

## Looks like this

![Website](static/images/golang-website.png)



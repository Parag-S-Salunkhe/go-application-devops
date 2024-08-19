# DevOps implementation on - Go Web Application

My motive of this project is to do implementation of DevOps. its a simple stateless web application.

In the guide every details are mentioned, also attached a doc where any questions related to project that I have faced-

Check here for [Implentation Guide](./Implementation-Guide-Docs), Questions and Troubleshooting
Part 1: Containerization using Docker & using Multi Stage Docker
Part 2: Writing K8 Manifests for svc, deployment and ingress
Part 3: Implementing ingress and Ingress controller (nginx)
Part 4: Implenting using Helm
Part 5: Github Actions to make CI
Part 6: ArgoCD for GitOps

Clone the base application- [Project](https://github.com/iam-veeramalla/go-web-app)

# Go Web Application

This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

## Running the server

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/courses` in your web browser.

## Looks like this

![Website](static/images/golang-website.png)



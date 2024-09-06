## Build Binary and app Run Locally

After cloning the project, install all go dependencies and build the app to run app locally 

```shell
sudo apt install golang-go
go build -o main .
./main # to run the binary (to run the application)
```
The server will start on port 8080. You can access it by navigating to http://localhost:8080/courses 
If you can see the app running we can proceed with conatainerization 

**Troubleshoot** : if the app doesn't start, go to **go.mod** file and change version from 1.22.5 to 1.22

## DockerFile

[Create dockerfile](https://github.com/Parag-S-Salunkhe/go-application-devops/blob/main/Dockerfile), and follow the multistage method for distroless image. 

install docker and give user the permission to docker.sock
```shell
sudo apt install docker.io
sudo chown $USER /var/run/docker.sock
```

Troubleshooting: If you are using WSL , start Docker Desktop -> settings -> resources -> WSL integration (enable it) 
Docker Desktop manages Docker Daemon and sometimes there are problems related to starting a layer when you have wsl on because of too many layers.

**Build the docker image** 
```shell
docker build -t dockerhub_username/app-repo-name:tag .  # example parag2608/go-web-app:v1
```
push it to docker hub using docker desktop or cli. for test purpose to show the impact of not doing multi stage docker here is the test file [Dokerfile](https://github.com/Parag-S-Salunkhe/go-application-devops/blob/main/Docker-Test-file/docker-one-stage-only)
build the test docker file to see the differences in images. 

## Run the Container

Run the container on port 8080, and app is also running on port 8080
```shell
docker run -p 8080:8080 -it parag2608/go-web-app:v1 
```
**Troubleshoot** : exit wsl and run the same command if facing trouble in running

To check if the container is running the application check on localhost again

----------------------------------------------------------

# Questionaire - [Answers](Questions&Answers.md#p1)

1. Why do we need a binary file? Can we run the application without the binary file? naming convention for binary file.

2. How is Docker Desktop helping ?

3. What is a distroless image? How does it help? how do you choose a distroless image? 

4. What are systems like 'init' , 'upstart' or 'systeminit' ?







   

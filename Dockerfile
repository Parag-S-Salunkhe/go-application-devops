# multi stage docker implementation, to reduce the size of the image. "base" is the alias 
FROM golang:1.22 as base

WORKDIR /app

# copies depencies from go.mod , developer can add dependencies to this file
COPY go.mod .

RUN go mod download

COPY . .

# builds  a binary called "main", which will be used to run the application
RUN go build -o main .

#final stage - distroless image

# we have taken a  gcr image which is very lightweight
FROM gcr.io/distroless/base

# copies binary with alias "base" from previous stage
COPY --from=base /app/main .

# copies static content of the web app, because it is not bundled in the binary
COPY --from=base /app/static ./static

# this is merely for documentation, it doent expose your app
EXPOSE 8080

# CMD is the first execution done when a container starts, no full form, only one CMD can be passed,
# if multiple CMD passed only the last one will run, current statement is for running to go app using binaru "main"
CMD [ "./main" ]
# Spring boot demo eks
This project is a simple crud realised with spring boot


## Dockerfile
We use bellsoft liberica as basic image optimised for Java, see the references below:
- https://hub.docker.com/r/bellsoft/liberica-runtime-container?utm_source=medium&utm_medium=post&utm_campaign=edelveismedium&utm_content=dockermultistage
- https://medium.com/@cat.edelveis/a-guide-to-docker-multi-stage-builds-for-spring-boot-08e3a64c9812

## Running the application in dev mode

```shell script
mvn clean package
```

## Create the image using podman
First start Podman
```
podman machine start
```
```shell script
podman build -f  src/main/docker/Dockerfile.jvm  -t my-spring-boot-app .
```

## Testing the application
Note: --location  to automatically handle HTTP redirects(3XX), especially important for web requests where resources might be relocated
```shell script
curl -X POST --location "http://localhost:8080/books" \
-H "Content-Type: application/json" \
--data "{\"title\": \"title 1\", \"author\": \"author 1\"}"
```
```shell script
curl -X GET --location "http://localhost:8080/books/1
```
```shell script
curl -X DELETE --location "http://localhost:8080/books/1
```





###Notes
In case of different environments: Linux, Windows, etc. apply the following command
```shell script
git add --renormalize .
```


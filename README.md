# Spring boot demo eks
This project is a simple crud realised with spring boot


## Dockerfile
We use bellsoft liberica as basic image optimised for Java, see the references below:
- https://hub.docker.com/r/bellsoft/liberica-runtime-container?utm_source=medium&utm_medium=post&utm_campaign=edelveismedium&utm_content=dockermultistage
- https://medium.com/@cat.edelveis/a-guide-to-docker-multi-stage-builds-for-spring-boot-08e3a64c9812
  
## packaging the application
```shell script
mvn clean package
```

## running the application
```shell script
mvn spring-boot:run
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


## Deploying to ECR with Podman
Reference from: https://docs.aws.amazon.com/AmazonECR/latest/userguide/Podman.html

Login:
```
aws ecr get-login-password --region region | podman login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
```

Push:
Create a repository on AWS(better also adding a namespace to group functionalities)\
 then tag locally the image and push to AWS ECR
```
podman tag local_image:tag aws_account_id.dkr.ecr.region.amazonaws.com/repository_name:tag 
podman push aws_account_id.dkr.ecr.region.amazonaws.com/repository_name:tag

```

## Terraform ECS
Reference: https://www.fosstechnix.com/create-an-amazon-ecs-cluster-using-terraform/

### Notes
In case of different environments: Linux, Windows, etc. apply the following command
```shell script
git add --renormalize .
```
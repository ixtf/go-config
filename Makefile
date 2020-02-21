language: go

version=1.0
docker_name=ixtf/go-config
#docker_name=ixtf/go-config:$(version)

build:
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o main .

docker:
	docker build -t $(docker_name) .

dockerPush: docker
	docker push $(docker_name)

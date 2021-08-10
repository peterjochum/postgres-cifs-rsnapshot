
NAME:=postgres-cifs-rsnapshot
DOCKER_REPOSITORY:=pjochum
DOCKER_IMAGE_NAME:=$(DOCKER_REPOSITORY)/$(NAME)
VERSION:=$(shell git describe --tags --always | cut -c2-)

docker:
	docker build . -t  $(DOCKER_IMAGE_NAME):$(VERSION)
	docker build . -t  $(DOCKER_IMAGE_NAME):latest

push-container: docker
	docker push $(DOCKER_IMAGE_NAME):$(VERSION)
	docker push $(DOCKER_IMAGE_NAME):latest
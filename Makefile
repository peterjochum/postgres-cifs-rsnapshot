
NAME:=postgres-cifs-rsnapshot
DOCKER_REPOSITORY:=pjochum
DOCKER_IMAGE_NAME:=$(DOCKER_REPOSITORY)/$(NAME)
VERSION:=$(shell git describe --tags --always | cut -c2-)
VERSION_MINOR:=$(shell git describe --tags --always | cut -c2- | cut -d. -f1-2)
VERSION_MAJOR:=$(shell git describe --tags --always | cut -c2- | cut -d. -f1)

docker:
	docker build . -t  $(DOCKER_IMAGE_NAME):$(VERSION)
	docker build . -t  $(DOCKER_IMAGE_NAME):$(VERSION_MINOR)
	docker build . -t  $(DOCKER_IMAGE_NAME):$(VERSION_MAJOR)
	docker build . -t  $(DOCKER_IMAGE_NAME):latest

push-container: docker
	docker push $(DOCKER_IMAGE_NAME):$(VERSION)
	docker push $(DOCKER_IMAGE_NAME):$(VERSION_MINOR)
	docker push $(DOCKER_IMAGE_NAME):$(VERSION_MAJOR)
	docker push $(DOCKER_IMAGE_NAME):latest

versiontest:
	echo "Major: $(VERSION_MAJOR)"
	echo "Minor: $(VERSION_MINOR)"
	echo "Patch: $(VERSION)"

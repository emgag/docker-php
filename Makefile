.PHONY: build

VERSION=7.4.33
VERSION_MAJOR=7
VERSION_MINOR=4
VERSION_PATCH=33
FLAVOUR=cli
TAG=php-buildtest

build: linux/amd64

%:
	docker buildx build --pull \
	  --build-arg VERSION=${VERSION} \
	  --build-arg VERSION_MAJOR=${VERSION_MAJOR} \
	  --build-arg VERSION_MINOR=${VERSION_MINOR} \
	  --build-arg VERSION_PATCH=${VERSION_PATCH} \
	  --build-arg FLAVOUR=${FLAVOUR} \
	  -t ${TAG}:${VERSION} \
	  --platform ${@} \
	  --load \
	  base

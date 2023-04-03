.PHONY: build

VERSION=8.2.4
VERSION_MAJOR=8
VERSION_MINOR=2
VERSION_PATCH=4
FLAVOUR=cli
TAG=php-buildtest

build: linux/amd64 linux/arm64

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

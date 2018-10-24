.PHONY: build 7.0 7.2
.ONESHELL:

IMAGE := emgag/php
IMAGE_70_VERSION := 7.0.32
IMAGE_70_UPSTREAM := 7.0.32
IMAGE_72_VERSION := 7.2.11
IMAGE_72_UPSTREAM := 7.2.11

build: 7.0 7.2 cron

7.0:
	# cli
	docker build --pull \
	--build-arg VERSION=${IMAGE_70_UPSTREAM} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_70_VERSION}-cli \
	7.0
	docker push ${IMAGE}:${IMAGE_70_VERSION}-cli
	# fpm
	docker build --pull \
	--build-arg VERSION=${IMAGE_70_UPSTREAM} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_70_VERSION}-fpm \
	7.0
	docker push ${IMAGE}:${IMAGE_70_VERSION}-fpm
	# cron
	docker build --pull \
	--build-arg VERSION=${IMAGE_70_VERSION} \
	-t ${IMAGE}:${IMAGE_70_VERSION}-cron \
	cron
	docker push ${IMAGE}:${IMAGE_70_VERSION}-cron

7.2:
	# cli
	docker build --pull \
	--build-arg VERSION=${IMAGE_72_UPSTREAM} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_72_VERSION}-cli \
	7.2
	docker push ${IMAGE}:${IMAGE_72_VERSION}-cli
	# fpm
	docker build --pull \
	--build-arg VERSION=${IMAGE_72_UPSTREAM} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_72_VERSION}-fpm \
	7.2
	docker push ${IMAGE}:${IMAGE_72_VERSION}-fpm
	# cron
	docker build --pull \
	--build-arg VERSION=${IMAGE_72_VERSION} \
	-t ${IMAGE}:${IMAGE_72_VERSION}-cron \
	cron
	docker push ${IMAGE}:${IMAGE_72_VERSION}-cron

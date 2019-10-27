.PHONY: build 7.1 7.2 7.3 7.4

IMAGE := emgag/php
IMAGE_71_VERSION := 7.1.33
IMAGE_71_UPSTREAM := 7.1.33
IMAGE_72_VERSION := 7.2.24
IMAGE_72_UPSTREAM := 7.2.24
IMAGE_73_VERSION := 7.3.11
IMAGE_73_UPSTREAM := 7.3.11
IMAGE_74_VERSION := 7.4.0RC4
IMAGE_74_UPSTREAM := 7.4.0RC4

build: 7.1 7.2 7.3 7.4

7.1:
	# cli
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_71_UPSTREAM} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_71_VERSION}-cli \
	base
	docker push ${IMAGE}:${IMAGE_71_VERSION}-cli
	# fpm
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_71_UPSTREAM} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_71_VERSION}-fpm \
	base
	docker push ${IMAGE}:${IMAGE_71_VERSION}-fpm
	# cron
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_71_VERSION} \
	-t ${IMAGE}:${IMAGE_71_VERSION}-cron \
	cron
	docker push ${IMAGE}:${IMAGE_71_VERSION}-cron
	# build (cli)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_71_VERSION} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_71_VERSION}-cli-build \
	build
	docker push ${IMAGE}:${IMAGE_71_VERSION}-cli-build
	# build (fpm)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_71_VERSION} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_71_VERSION}-fpm-build \
	build
	docker push ${IMAGE}:${IMAGE_71_VERSION}-fpm-build

7.2:
	# cli
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_72_UPSTREAM} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_72_VERSION}-cli \
	base
	docker push ${IMAGE}:${IMAGE_72_VERSION}-cli
	# fpm
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_72_UPSTREAM} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_72_VERSION}-fpm \
	base
	docker push ${IMAGE}:${IMAGE_72_VERSION}-fpm
	# cron
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_72_VERSION} \
	-t ${IMAGE}:${IMAGE_72_VERSION}-cron \
	cron
	docker push ${IMAGE}:${IMAGE_72_VERSION}-cron
	# build (cli)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_72_VERSION} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_72_VERSION}-cli-build \
	build
	docker push ${IMAGE}:${IMAGE_72_VERSION}-cli-build
	# build (fpm)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_72_VERSION} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_72_VERSION}-fpm-build \
	build
	docker push ${IMAGE}:${IMAGE_72_VERSION}-fpm-build

7.3:
	# cli
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_73_UPSTREAM} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_73_VERSION}-cli \
	base
	docker push ${IMAGE}:${IMAGE_73_VERSION}-cli
	# fpm
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_73_UPSTREAM} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_73_VERSION}-fpm \
	base
	docker push ${IMAGE}:${IMAGE_73_VERSION}-fpm
	# cron
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_73_VERSION} \
	-t ${IMAGE}:${IMAGE_73_VERSION}-cron \
	cron
	docker push ${IMAGE}:${IMAGE_73_VERSION}-cron
	# build (cli)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_73_VERSION} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_73_VERSION}-cli-build \
	build
	docker push ${IMAGE}:${IMAGE_73_VERSION}-cli-build
	# build (fpm)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_73_VERSION} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_73_VERSION}-fpm-build \
	build
	docker push ${IMAGE}:${IMAGE_73_VERSION}-fpm-build

7.4:
	# cli
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_74_UPSTREAM} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_74_VERSION}-cli \
	base
	docker push ${IMAGE}:${IMAGE_74_VERSION}-cli
	# fpm
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_74_UPSTREAM} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_74_VERSION}-fpm \
	base
	docker push ${IMAGE}:${IMAGE_74_VERSION}-fpm
	# cron
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_74_VERSION} \
	-t ${IMAGE}:${IMAGE_74_VERSION}-cron \
	cron
	docker push ${IMAGE}:${IMAGE_74_VERSION}-cron
	# build (cli)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_74_VERSION} \
	--build-arg FLAVOUR=cli \
	-t ${IMAGE}:${IMAGE_74_VERSION}-cli-build \
	build
	docker push ${IMAGE}:${IMAGE_74_VERSION}-cli-build
	# build (fpm)
	docker build --no-cache --pull \
	--build-arg VERSION=${IMAGE_74_VERSION} \
	--build-arg FLAVOUR=fpm \
	-t ${IMAGE}:${IMAGE_74_VERSION}-fpm-build \
	build
	docker push ${IMAGE}:${IMAGE_74_VERSION}-fpm-build

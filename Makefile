PLATFORM = linux/386
IMAGE    = tcc-i386

all:: lint build extract clean

lint::
	docker run --rm -i \
		-v "${PWD}/.hadolint.yaml:/bin/hadolint.yaml" \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build::
	docker buildx build --progress plain --platform $(PLATFORM) -t $(IMAGE) .

extract::
	docker run -d --name $(IMAGE) $(IMAGE)
	docker export -o $(IMAGE).tar $(IMAGE)
	docker container rm $(IMAGE)
	rm -rf bin include lib share
	tar xf $(IMAGE).tar --strip-components=4 opt/tinycc/thirdparty/tcc
	rm $(IMAGE).tar

clean::
	docker image rm $(IMAGE)

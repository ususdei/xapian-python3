
IMG_NAME=ususdei/archbuild
DATA=${PWD}
CMD=su packager makepkg


all: image
	docker run --rm -it --volume=${DATA}:/data ${IMG_NAME} ${CMD}

shell: image
	docker run --rm -it --volume=${DATA}:/data ${IMG_NAME} bash -l

image:
	docker build -t ${IMG_NAME} .


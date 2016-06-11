
IMG_NAME=ususdei/archbuild
DATA=${PWD}
CMD=su packager makepkg


all: image
	docker run --rm -it --volume=${DATA}:/data ${IMG_NAME} ${CMD}

shell: image
	docker run --rm -it --volume=${DATA}:/data ${IMG_NAME} bash -l

image:
	docker build -t ${IMG_NAME} .

archlinux:
	sudo pacman -S arch-install-scripts expect
	mkdir -p arch
	wget https://raw.githubusercontent.com/docker/docker/master/contrib/mkimage-arch.sh -O arch/mkimage-arch.sh
	chmod +x arch/mkimage-arch.sh
	cp /etc/pacman.conf arch/mkimage-arch-pacman.conf
	cd arch && sudo ./mkimage-arch.sh

install:
	sudo pacman -U xapian-python3-git-r*.pkg.tar.xz

clean:
	-rm -rf arch
	-rm -rf src pkg xapian-python3
	-rm -rf xapian-python3-git-r*.pkg.tar.xz
	-sed -i 's/^pkgver=r.\+/pkgver=git/' PKGBUILD


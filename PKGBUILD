
# Maintainer: Markus Blöchl <bloechl@in.tum.de>
_name=xapian-python3
pkgname=$_name-git
pkgver=git
pkgrel=1
pkgdesc="Open source search engine library with python3 and lua bindings"
arch=('x86_64')
url="http://www.xapian.org"
license=('GPL')
groups=()
depends=('lua' 'python>=3.5')
makedepends=('git' 'zlib' 'libutil-linux' 'help2man' 'graphviz' 'perl' 'tcl' 'python-docutils' 'python-sphinx')
provides=("$_name" xapian-core)
conflicts=("$_name" xapian-core)
replaces=()
backup=()
options=()
install=
source=("$_name::git+https://github.com/xapian/xapian")
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_name"
    local py_minor=$(python3 -c 'import sys;print(sys.version_info.minor)')
    if [ "$py_minor" -ge 5 ]; then
        sed -i -e "s/'module' object has no attribute/module 'xapian' has no attribute/" xapian-bindings/python3/smoketest.py
        sed -i -e 's/.pyo/.opt-1.pyc/g' xapian-bindings/python3/Makefile.am 
    fi
}

build() {
	cd "$srcdir/$_name"
    touch xapian-letor/.nobootstrap
    touch xapian-applications/omega/.nobootstrap
    ./bootstrap
    ./configure --prefix=/usr --with-python3 --with-lua
    make all
}

check() {
	cd "$srcdir/$_name"
    make -k check
}

package() {
	cd "$srcdir/$_name"
    #cp xapian-bindings/python3/xapian/__pycache__/__init__.cpython-35.{opt-1.pyc,pyo}
	make DESTDIR="$pkgdir/" install
    #mv $pkgdir/usr/lib/python3.5/site-packages/xapian/__init__.cpython-35.{pyo,opt-1.pyc}
}


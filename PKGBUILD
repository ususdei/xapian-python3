
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
makedepends=('git' 'cmake' 'zlib' 'libutil-linux' 'help2man' 'graphviz' 'perl' 'tcl' 'python-docutils' 'python-sphinx')
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
    patch -p 1 <<EOF
diff --git a/bootstrap b/bootstrap
index ec68966..01876fa 100755
--- a/bootstrap
+++ b/bootstrap
@@ -220,7 +220,9 @@ END
 	mv qtools/qglobal.hT qtools/qglobal.h
     fi
 
-    if test -n "\$AUTOCONF" ; then
+    if test -f "CMakeLists.txt" ; then
+      cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH="\$instdir" .
+    elif test -n "\$AUTOCONF" ; then
       ./configure --prefix "\$instdir" AUTOCONF="\$AUTOCONF"
     else
       ./configure --prefix "\$instdir"
@@ -360,8 +362,8 @@ else
   cd BUILD
 
   # The last field is the SHA1 checksum of the tarball.
-  lazy_build doxygen 1.8.8 \\
-    src.tar.gz cd511c73e7669dde5ac3e14a5d1abae093aaf1d9
+  lazy_build doxygen 1.8.11 \\
+    src.tar.gz c0841007cf8a7910ccf0d8e4f7a5dd8fd2d9fc18
   lazy_build autoconf 2.68 \\
     tar.xz 63a3b495400c1c053f2f6b62efb7a5c0ad4156c9 \\
     tar.bz2 b534c293b22048c022b1ff3a372b9c03f26170b4 \\

EOF
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
	make DESTDIR="$pkgdir/" install
}


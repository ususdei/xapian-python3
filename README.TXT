
This repo allowes one to build xapian with python3 and lua bindings from git for archlinux in a standard environment.

Make sure you have a recent archlinux image in your docker registry, otherwise use `$make archlinux` first.
`$ make`  will then fire up a docker container running archlinux and build xapian from source.
The result will appear in the current directory.

Of course you can also just use the PKGBUILD alone.

I only tested it with xapian 1.3.3 and python 3.5 for now.

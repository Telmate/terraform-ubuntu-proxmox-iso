Ubuntu for Terraform and Proxmox
==================

Build a custom Ubuntu base box for Terraform+Proxmox by downloading, extracting,
tweaking, and packaging the stock Ubuntu ISO.

Based on: https://github.com/yep/vagrant-ubuntu


Build dependencies
------------------

* `curl`(1).
* `m4`(1).
* `mkisofs`(1) from the `cdrtools` package available from MacPorts or
  Homebrew.

Runtime dependencies
--------------------

The results are bootable ISO images and so should run on any `i386` or
`amd64` hardware.  They are only tested in Proxmox.

Features in the ISO
-------------------


Building
--------

Edit configuration in

	config.sh

Building ISO images:

	./build-iso


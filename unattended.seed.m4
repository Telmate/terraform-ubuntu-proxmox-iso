# Preseed Ubuntu for Vagrant.

# Network.
d-i netcfg/choose_interface select eth1
d-i netcfg/get_hostname string __HOST__
d-i netcfg/get_domain string __DOMAIN__
d-i netcfg/wireless_wep string

# Clock.
d-i clock-setup/utc boolean true
d-i time/zone string UTC

# Partitions.
d-i partman-auto/disk string /dev/vda
d-i partman-auto/method string lvm
d-i partman-lvm/device_remove_lvm boolean true
d-i partman-md/device_remove_md boolean true
d-i partman-auto-lvm/guided_size string max
d-i partman-lvm/confirm boolean true
d-i partman-lvm/confirm_nooverwrite boolean true
d-i partman-auto/choose_recipe select atomic
d-i partman/default_filesystem string ext4
d-i partman/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true

# Kernel.
d-i base-installer/kernel/override-image string __KERNEL__

# Users.
d-i passwd/root-password password __ROOT_PASSWORD__
d-i passwd/root-password-again password __ROOT_PASSWORD__
d-i passwd/user-uid string 1000
d-i passwd/user-fullname string Vagrant
d-i passwd/username string __USERNAME__
d-i passwd/user-password password __PASSWORD__
d-i passwd/user-password-again password __PASSWORD__
d-i user-setup/allow-password-weak boolean true
d-i user-setup/encrypt-home boolean false

# Packages and repositories.
d-i mirror/http/proxy string
tasksel tasksel/first multiselect
d-i pkgsel/include string curl openssh-server
d-i pkgsel/update-policy select none
d-i pkgsel/install-language-support boolean false

# Grub and reboot.
d-i grub-installer/only_debian boolean true
d-i grub-installer/with_other_os boolean true
d-i finish-install/reboot_in_progress note
d-i cdrom-detect/eject boolean true
d-i debian-installer/splash boolean false
d-i debian-installer/exit/poweroff boolean true

# Everything else.
d-i preseed/late_command string sh /cdrom/late_command.sh

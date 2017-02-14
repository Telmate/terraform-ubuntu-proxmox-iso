#

# The nickname of this ISO, VirtualBox image, and Vagrant box.
: ${NICKNAME:="terraform"}

# Arguments given to the download router.
: ${VERSION:="14.04.5"}
: ${DISTRO:="server"}
: ${RELEASE:="latest"}

# Architecture being built (i386 or amd64).
: ${ARCH:="amd64"}

# Hardcoded host information.
: ${HOST:="tfnode"}
: ${DOMAIN:="terraform.io"}
: ${ROOT_PASSWORD:=`openssl rand -base64 24`}
: ${USERNAME:="terraform"}
: ${PASSWORD:=`openssl rand -base64 24`}

# SSH key to be authorized in virtual machines.
: ${PRIVATE_KEY:="terraform"}

if [ ! -f "$PRIVATE_KEY" ]; then
	ssh-keygen -t rsa -b 4096 -N "" -C "$USERNAME@$DOMAIN" -f "$PRIVATE_KEY"
fi

chmod 600 "$PRIVATE_KEY"
: ${PUBLIC_KEY:="terraform.pub"}

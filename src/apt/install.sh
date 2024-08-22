#!/bin/bash
set -e
set -x

echo "Activating feature 'color'"
echo "The provided favorite color is: ${PACKAGES}"


# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

if [ -z "$PACKAGES" ]; then
  echo "No APT packages to install"
else
  # shellcheck disable=SC2086
  sudo apt update && sudo apt install -y ${PACKAGES} && sudo apt autoremove -y && sudo apt clean
  # sudo rm -rf /tmp/* # It's on Read-Only filesystem
fi

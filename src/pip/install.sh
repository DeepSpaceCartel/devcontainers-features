#!/bin/bash
set -e
set -x

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

if [ -z "${PACKAGES}" ]; then
  mkdir -pv "${LOCATION}"
  echo "No PIP packages to install" | tee -a "${LOCATION}/install.log"
else
  python3 -m venv "${LOCATION}"
  source "${LOCATION}/bin/activate"
  pip install ${PACKAGES}
fi

#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
# shellcheck disable=SC1091
source dev-container-features-test-lib

printenv

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "Skipped by default" grep "No PIP packages to install" "/var/tmp/.venv/install.log"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

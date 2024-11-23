#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
# shellcheck disable=SC1091
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "Chech that shellcheck installed" bash -c "shellcheck --version | grep 'ShellCheck - shell script analysis tool'"
check "Check that shfmt is present in $PATH" bash -c "command -v shfmt"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

#!/bin/bash

abort() {
    printf "%s\n" "$@"
    exit 1
}

# Make sure BASH Is installed
if [ -z "${BASH_VERSION:-}" ]
then
    abort "Bash is required to execute this script."
fi

# Check OS
OS="$(uname)"
MACHINE="$(uname -m)"
if [[ "${OS}" != "Darwin" && "${MACHINE}" != "arm64" ]]
then
    abort "For now, Calcead is only supported for MacOS arm64 machines. You need to build from source if you are on another machine."
fi

# Check if `calcead` exists in their system
if ! [ -x "$(command -v calcead)" ]
then
    abort "Calcead must be installed. You can install by here: https://github.com/jackprogramsjp/calcead"
fi

# Check if `llvm` exists in their system
if ! [ -x "$(command -v llc)" ]
then
    abort "LLVM must be installed. If you have homebrew, just run this: brew install llvm"
fi

# Download
rm -rf /usr/local/bin/calceadc # Make sure calceadc is removed before installing it with curl
curl -f https://raw.githubusercontent.com/jackprogramsjp/calceadc/main/calceadc.sh -o /usr/local/bin/calceadc && echo "Successfully installed." || echo "Failed to install with curl."
chmod +x /usr/local/bin/calceadc # make script be able to execute
#!/bin/bash

# Check if `calcead` exists in their system
if ! [ -x "$(command -v calcead)" ]
then
    echo "Calcead must be installed. You can install by here: https://github.com/jackprogramsjp/calcead"
    exit 1
fi

# Check if `llvm` exists in their system
if ! [ -x "$(command -v llc)" ]
then
    abort "LLVM must be installed. If you have homebrew, just run this: brew install llvm"
fi

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Usage: calceadc [-o <output>] [--verbose] file"
            exit 0
            ;;
        --verbose)
            shift
            export VERBOSE='true'
            ;;
        -o)
            shift
            if test $# -gt 0; then
                export OUTPUT=$1
            else
                echo "no output dir specified"
                exit 1
            fi
            shift
            ;;
        *)
            break
            ;;
    esac
done

if [ -z "${OUTPUT}" ]
then
    export OUTPUT="a.out"
fi

if [ -z "$1" ]
then
    echo "error: [file] not specified" >&2
    exit 1
fi

if [ "${VERBOSE}" = "true" ]
then
    set -x #echo on
fi

# Compile file
calcead "$1"
llc "$1.ll"
cc "$1.s" -o "${OUTPUT}"

# Remove extra generated files
rm "$1.ll" "$1.s"

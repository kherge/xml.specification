#!/usr/bin/env bash

FILE="$1"
HERE="$(dirname "$(readlink -f "$0")")"

if [ -f "$FILE" ]; then
    xmllint -noout \
        -schema "$HERE/../schema/specification.xsd" \
        "$1"

    exit $?
fi

echo "$FILE: No such file" >&2
exit 1

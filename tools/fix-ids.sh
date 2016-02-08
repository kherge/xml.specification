#!/usr/bin/env bash

###
# Scan for identifiers matching a prefix.
#
# @param string FILE   The path to the file.
# @param string PREFIX The prefix to match against.
#
# @return string[] A list of identifiers.
##
function findIds()
{
    local FILE="$1"
    local PREFIX="$2"

    grep -Po '<number>'$PREFIX'-(\d+)</number>' "$FILE" \
        | cut -d\> -f2 \
        | cut -d\< -f1
}

###
# Fixes all identifiers and references matching a prefix.
#
# @param string FILE   The path to the file.
# @param string PREFIX The prefix to match against.
##
function fix()
{
    local COUNTER=0
    local FILE="$1"
    local PREFIX="$2"

    declare -A MAP=()

    for CURRENT in $(findIds "$FILE" "$PREFIX"); do
        UPDATED="$PREFIX-$COUNTER"

        ((COUNTER++))

        fixIds "$FILE" "$CURRENT" "$UPDATED"
        fixIdRefs "$FILE" "$CURRENT" "$UPDATED"
    done
}

###
# Replaces an identifier with an updated value.
#
# @param string FILE    The path to the file.
# @param string CURRENT The current identifier value.
# @param string UPDATED The updated identifier value.
##
function fixIds()
{
    local FILE="$1"
    local CURRENT="$2"
    local UPDATED="$3"

    sed -i 's#<number>'$CURRENT'</number>#<number>'$UPDATED'</number>#g' "$FILE"
}

###
# Replaces an identifier reference with an updated value.
#
# @param string FILE    The path to the file.
# @param string CURRENT The current identifier value.
# @param string UPDATED The updated identifier value.
##
function fixIdRefs()
{
    local FILE="$1"
    local CURRENT="$2"
    local UPDATED="$3"

    sed -i 's#<reference>'$CURRENT'</reference>#<reference>'$UPDATED'</reference>#g' "$FILE"
}

# The path to the specification file.
FILE="$1"

# Display help message.
if [ ! -f "$FILE" ]; then
    echo "Usage: $(basename "$0") SPEC
Renumbers all of the identifiers beginning at 0.

SPEC
  The path to the specification XML document.
" >&2
    exit 1
fi

fix $FILE UC
fix $FILE FR
fix $FILE NFR

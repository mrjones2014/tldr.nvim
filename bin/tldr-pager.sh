#!/usr/bin/env bash

TLDR_COMMAND="$1"
TLDR_QUERY="$2"

if command -v less &>/dev/null; then
	eval "$TLDR_COMMAND $TLDR_QUERY | less"
else
	eval "$TLDR_COMMAND $TLDR_QUERY"
fi

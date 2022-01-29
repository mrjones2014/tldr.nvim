#!/usr/bin/env bash

TLDR_COMMAND="$1"
TLDR_EXTRA_ARGS="$2"
TLDR_QUERY="$3"

if command -v less &>/dev/null; then
  eval "$TLDR_COMMAND $TLDR_EXTRA_ARGS $TLDR_QUERY | less"
else
  eval "$TLDR_COMMAND $TLDR_EXTRA_ARGS $TLDR_QUERY"
fi

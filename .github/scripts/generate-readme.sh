#!/usr/bin/env bash

set -euo pipefail

PLUGINS_FILE=${PLUGINS_FILE:-$(git rev-parse --show-toplevel)/lua/cwebster/plugins.lua}
README_FILE=${PLUGINS_FILE:-$(git rev-parse --show-toplevel)/README.md}


cat $PLUGINS_FILE | \
  sed -E '1,/^\s*-- PLUGINS_BEGIN/d' | \
  sed -E '/^\s*-- PLUGINS_END/,$d' | \
  sed -E 's/^\s*-- PLUGINS: (.*)$/### \1/' | \
  sed -E '/^\s*--/d' | \
  perl -p0e 's/.*(["])(.*?\/.*?)\1.*/ - \2/g' | \
  sed -E '/^( - )|(###)/!d' | \
  sed -E 's/^ - (.*)$/ - [\1](https:\/\/github.com\/\1)/'



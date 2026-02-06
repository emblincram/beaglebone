#!/bin/bash

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

YOCTO_DL_DIR_HOST="${YOCTO_DL_DIR:-"${REPO_ROOT}/../yocto-shared/downloads"}"
YOCTO_SSTATE_DIR_HOST="${YOCTO_SSTATE_DIR:-"${REPO_ROOT}/../yocto-shared/sstate-cache"}"

mkdir -p "$YOCTO_DL_DIR_HOST" "$YOCTO_SSTATE_DIR_HOST"

docker run -it --rm \
  -v "${REPO_ROOT}:/home/yocto" \
  -v "${YOCTO_SSTATE_DIR_HOST}:/home/yocto/sstate-cache" \
  -v "${YOCTO_DL_DIR_HOST}:/home/yocto/downloads" \
  ghcr.io/a-eberle/devcon-pq-min:latest bash

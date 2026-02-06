#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

# Basisverzeichnis setzen (das Verzeichnis, in dem das Skript liegt)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "${BASE_DIR}"

# Konfigurationspfad setzen
export TEMPLATECONF="${BASE_DIR}/meta-pq-board/conf/templates/default"
echo "TEMPLATECONF=${TEMPLATECONF}"

# Build-Umgebung initialisieren
source "${BASE_DIR}/poky/oe-init-build-env" "${BASE_DIR}/build"

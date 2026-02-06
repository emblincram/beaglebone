#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2025 Roman Koch <koch.romam@gmail.com>

source "$(dirname "$0")/utilities.sh"

# parameter

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pfad>"
    exit 1
fi

WORKSPACE_PATH=$1
YOCTO_SHARED_DIR=${WORKSPACE_PATH}/../../yocto-shared

source ~/.bashrc

create_directory "${YOCTO_SHARED_DIR}/downloads"
create_directory "${YOCTO_SHARED_DIR}/sstate-cache"
create_directory "${WORKSPACE_PATH}/build"

# check directories
export YOCTO_DL_DIR="${YOCTO_SHARED_DIR}/downloads"
export YOCTO_SSTATE_DIR="${YOCTO_SHARED_DIR}/sstate-cache"

git config --global --add safe.directory '*'

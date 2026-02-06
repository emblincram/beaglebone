#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2025 Roman Koch <koch.romam@gmail.com>

source "$(dirname "$0")/utilities.sh"

# parameter

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

WORKSPACE_PATH=$1

LAYER_DIRECTORY=${WORKSPACE_PATH}

# yocto layer for beagle-x15
clone_and_checkout "https://git.yoctoproject.org/poky" "${WORKSPACE_PATH}/poky" "scarthgap" 1
clone_and_checkout "https://git.yoctoproject.org/meta-ti" "${WORKSPACE_PATH}/meta-ti" "scarthgap" 1
clone_and_checkout "https://git.yoctoproject.org/meta-arm" "${WORKSPACE_PATH}/meta-arm" "scarthgap" 1
clone_and_checkout "https://github.com/openembedded/meta-openembedded.git" "${WORKSPACE_PATH}/meta-openembedded" "scarthgap" 1

if [ -z "$GITHUB_TOKEN" ]; then
    echo "ERROR: GITHUB_TOKEN not set"
    exit 1
fi

# Project meta-layer
clone_and_checkout "https://${GITHUB_TOKEN}@github.com/a-eberle/meta-pq-box.git" "${WORKSPACE_PATH}/meta-pq-box" "main"

# meta-pq-box applications
create_directory "${WORKSPACE_PATH}/app"
clone_and_checkout "https://${GITHUB_TOKEN}@github.com/a-eberle/pq-storage.git" "${WORKSPACE_PATH}/app/pq-storage" "main"
clone_and_checkout "https://${GITHUB_TOKEN}@github.com/a-eberle/pq-state-sync.git" "${WORKSPACE_PATH}/app/pq-state-sync" "main"

echo "copy .scripts functions"
create_directory "${LAYER_DIRECTORY}/build"
create_directory "${LAYER_DIRECTORY}/.scripts"
"${LAYER_DIRECTORY}/.scripts/copy-tools.sh" "${LAYER_DIRECTORY}/.scripts" "${LAYER_DIRECTORY}/build"

echo "copy environment activation script"
cp "${LAYER_DIRECTORY}/.scripts/activate-env.sh" "${LAYER_DIRECTORY}/"

echo 'dev-container created.'


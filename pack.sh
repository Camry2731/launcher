#!/bin/bash

# Preflight checks

if [ "$1x" != "x" ];
then
    LAUNCHER_VERSION=$1
else
    echo "Error, LAUNCHER_VERSION is required."
    exit
fi

if [ "$2x" != "x" ];
then
    TOOLS_VERSION=$2
else
    echo "Error, TOOLS_VERSION is required."
    exit
fi

# Set required vars
BASE_DIR=${PWD}
PREPACK_DIR=${PWD}/build/prepack
RELEASE_DIR=${PWD}/build/release

# Prepare workspace
mkdir -p ${PREPACK_DIR}/launcher/versions ${RELEASE_DIR}

# Prepare and package launcher
pack200 --no-gzip ${PREPACK_DIR}/launcher/versions/${LAUNCHER_VERSION}.jar.pack ${BASE_DIR}/launcher-fancy/build/libs/launcher-fancy-${LAUNCHER_VERSION}-all.jar
cp ${BASE_DIR}/launcher-bootstrap/build/libs/launcher-bootstrap-${LAUNCHER_VERSION}-all.jar ${PREPACK_DIR}/launcher/routh-io-launcher.jar
envsubst '${LAUNCHER_VERSION}' < ${BASE_DIR}/latest.template > ${PREPACK_DIR}/launcher/latest.json
tar --create --gzip --verbose --file=${RELEASE_DIR}/launcher.tar.gz --directory=${PREPACK_DIR}/launcher .

# Pack creation tools
cp ${BASE_DIR}/launcher-builder/build/libs/launcher-builder-${LAUNCHER_VERSION}-all.jar ${RELEASE_DIR}/launcher-builder-${LAUNCHER_VERSION}.jar
cp ${BASE_DIR}/creator-tools/build/libs/creator-tools-${TOOLS_VERSION}-all.jar ${RELEASE_DIR}/creator-tools-${TOOLS_VERSION}.jar

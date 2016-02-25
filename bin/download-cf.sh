#!/bin/bash
# download-cf.sh downloads official cf binnaries on `bin` directory.
# See https://github.com/cloudfoundry/cli/releases
set -e

VER=${1}
if [ -z "${VER}" ]; then
    VER=6.16.0
fi

PLATFORM="macosx64"

# Skip if that version is already exist
if [ -f ${HOME}/bin/cf-${VER} ]; then
    echo "[INFO] cf-${VER} is already downloaded"
    exit 0
fi

curl -L --output /tmp/cf-${VER}.tgz \
     "https://cli.run.pivotal.io/stable?release=${PLATFORM}-binary&version=${VER}"

tar xvf /tmp/cf-${VER}.tgz
mv cf ${HOME}/bin/cf-${VER}

echo "[INFO] Link to ${HOME}/bin/cf"
if [ -h ${HOME}/bin/cf ]; then
    rm ${HOME}/bin/cf
fi
ln -s ${HOME}/bin/cf-${VER} ${HOME}/bin/cf

echo "[INFO] Show version"
${HOME}/bin/cf -v



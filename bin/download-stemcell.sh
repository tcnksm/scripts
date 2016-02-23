#!/bin/bash
# Download stemcell and place it on $HOME directory

VERSION=${1}
if [ -z "${VERSION}" ]; then
    # Set default version
    VERSION=389
fi

# Check file existance
if [ ! -d ${HOME}/.stemcell ]; then
    mkdir ${HOME}/.stemcell
fi

STEMCELL=bosh-stemcell-${VERSION}-warden-boshlite-ubuntu-trusty-go_agent.tgz
if [ -f ${HOME}/.stemcell/${STEMCELL} ]; then
    echo "${STEMCELL} was already downloaded"
    exit 0
fi     

bosh download public stemcell ${STEMCELL}
mv ${STEMCELL} ${HOME}/.stemcell/.

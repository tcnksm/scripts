#!/bin/bash

TARGET="192.168.59.4"

echo "----> Resume bosh-lite"
cd ${HOME}/src/github.com/cloudfoundry/bosh-lite
vagrant resume

echo "---> Target"
bosh target ${TARGET} lite

echo "---> Login as admin"
bosh login admin admin

echo "----> Upload stemcell"
bosh stemcells


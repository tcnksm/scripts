#!/bin/bash

echo "----> Destory bosh-lite"
cd ${HOME}/src/github.com/cloudfoundry/bosh-lite
vagrant destroy --force

echo "----> Fetch latest source"
git pull

echo "----> Start bosh-lite"
# vagrant up --provider=virtualbox

echo "----> Add route"
sudo bin/add-route

echo "---> Target"
TARGET="192.168.59.4"
bosh target ${TARGET} lite

echo "---> Login as admin"
bosh login admin admin

echo "----> Upload stemcell"
bosh upload stemcell ~/.stemcell/bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz
bosh stemcells

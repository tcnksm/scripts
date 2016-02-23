#!/bin/bash
# Destroy old bosh-lite and start new one.

echo "----> Destory bosh-lite"
cd ${HOME}/src/github.com/cloudfoundry/bosh-lite
vagrant destroy --force

echo "----> Start bosh-lite"
vagrant up --provider=virtualbox

echo "----> Add route"
sudo bin/add-route

echo "----> Upload stemcell"
bosh upload stemcell ~/.stemcell/bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz
bosh stemcells

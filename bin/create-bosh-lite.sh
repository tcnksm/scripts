#!/bin/bash

cd ${HOME}/src/github.com/cloudfoundry/bosh-lite

echo "----> Destory bosh-lite"
vagrant destroy --force

echo "----> Fetch latest source"
git pull

echo "----> Start bosh-lite"
vagrant up --provider=virtualbox

echo "----> Add route"
sudo bin/add-route

echo "----> Target"
bosh target 192.168.50.4 lite

echo "---> Login as admin"
bosh login admin admin

echo "----> Upload stemcell"
bosh upload stemcell --skip-if-exists ~/.stemcell/bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz
bosh stemcells

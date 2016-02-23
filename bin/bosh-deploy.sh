#!/bin/bash
# Run bosh deploy on current work directoty.
# You must be on the release job direcoty.
bosh create release --force && bosh upload release && bosh --non-interactive deploy ${@}

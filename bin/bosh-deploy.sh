#!/bin/bash
# Run bosh deploy on current work directoty.
bosh create release --force && bosh upload release && bosh --non-interactive deploy

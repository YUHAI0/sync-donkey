#!/usr/bin/env bash

for i in `cat nodes`; do
  ssh -p {{SSHPORT}} $i ${@}
done

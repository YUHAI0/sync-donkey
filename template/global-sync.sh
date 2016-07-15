#!/usr/bin/env bash

for i in `cat nodes`; do
  ssh -p {{SSHPORT}} $i "mkdir -p ~/{{TARGET}}"
  scp -P {{SSHPORT}} -r $1 $i:~/{{TARGET}}
done

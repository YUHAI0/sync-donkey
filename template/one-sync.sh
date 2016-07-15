#!/usr/bin/env bash
host=$1
shift
files=${@}

ssh -p {{SSHPORT}} $host mkdir -p ~/{{TARGET}}
scp -P {{SSHPORT}} -r $files $host:~/{{TARGET}}

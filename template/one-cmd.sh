#!/usr/bin/env bash

host=$1
shift
ssh -p {{SSHPORT}} $host ${@}

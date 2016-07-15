#!/usr/bin/env bash

for i in `cat nodes`; do
  ./super-cmd.sh $i ${@}
done

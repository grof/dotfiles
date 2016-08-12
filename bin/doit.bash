#!/bin/bash

for hostname in $(cat $1); do
  echo
  echo '#-----------------------------------------'
  echo "# ${hostname}"
  echo '#-----------------------------------------'
  echo

  ssh $hostname "$2"

done


#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Usage: ./$0 <X500> <LAB_MACHINE>"
    exit 1
fi

ssh-keygen -t ed25519 -q -N ""

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519*

ssh-copy-id $1@$2

#!/bin/bash

# don't leave the <> in the below parts
X500=<your X500>
LAB_MACHINE=<desired lab machine>  # e.g. csel-kh1250-37.cselabs.umn.edu

ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N "" 
ssh-copy-id -i ~/.ssh/id_rsa.pub $X500@$LAB_MACHINE

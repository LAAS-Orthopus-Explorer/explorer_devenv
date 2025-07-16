#! /bin/bash

mkdir -p src

git clone git@github.com:ORTHOPUS-EXPLORER/explorer_docs.git
mkdir src
cd src
git clone --recursive -b prod/poc2 git@github.com:LAAS-Orthopus-Explorer/explorer_ws.git


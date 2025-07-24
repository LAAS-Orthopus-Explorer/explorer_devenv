#! /bin/bash

git clone --recursive https://gitlab.laas.fr/rap/common/phd_remi/o2r_pi2_controllers.git

mkdir -p src

git clone git@github.com:ORTHOPUS-EXPLORER/explorer_docs.git
mkdir src
cd src
git clone --recursive git@github.com:LAAS-Orthopus-Explorer/explorer_ws.git


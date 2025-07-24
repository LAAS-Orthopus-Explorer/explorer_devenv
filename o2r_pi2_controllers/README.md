# O2R PI2 Controllers
This package is supposed to be used in [tirrex_workspace](https://github.com/Tirrex-Roboterrium/tirrex_workspace). Some robot_cfg will not be runable as they are since there are using ros msg, urdf and yaml config files from tirrex_workspace.

Python package including MPC controller for different robots (mobile manipulators and bases).
It also includes some robots models witch can be used as examples.


## Install

```bash
cd o2r_pi2_controllers
pip install -e .
```

### CasADI
Casadi is a submodule for symbolic writing.

```bash
sudo apt install gfortran liblapack-dev pkg-config --install-recommends
sudo apt install swig
cd third_party/casadi
git submodule update --recursive --init
mkdir build
cd build
cmake -DWITH_PYTHON=ON -DWITH_IPOPT=OFF -DWITH_OPENMP=ON -DWITH_THREAD=ON ..
make
sudo make install
```

### Acados
Acados is a submodule for nonlinear optimal control.

```bash
cd third_party/acados
git submodule update --recursive --init
mkdir -p build
cd build
cmake -DACADOS_WITH_QPOASES=ON DACADOS_WITH_OSQP=ON DACADOS_WITH_DAQP=ON DACADOS_WITH_QPDUNES=ON ..
make install -j4
pip install -e ../interfaces/acados_template
wget -O t_renderer https://github.com/acados/tera_renderer/releases/download/v0.0.34/t_renderer-v0.0.34-linux
mv t_renderer ../bin/
chmod 755 ../bin/t_renderer
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"<PATH_TO_O2R>/third_party/acados/lib"
export ACADOS_SOURCE_DIR="<PATH_TO_O2R>/third_party/acados"
```
You can add those 2 last lines to your .bashrc 

Run an acados code to generate the Tera template.

### Pinocchio 3
Pinocchio is a package for rigid multi-body dynamics. It is used for dynamic modeling in `campero_dynamic.py`, but you don't need it for other robots' configuration.

install it via [this link](https://stack-of-tasks.github.io/pinocchio/download.html).

Do not forget to do:
```bash
export PATH=/opt/openrobots/bin:$PATH
export PKG_CONFIG_PATH=/opt/openrobots/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/opt/openrobots/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/opt/openrobots/lib/python3.10/site-packages:$PYTHONPATH # Adapt your desired python version here
export CMAKE_PREFIX_PATH=/opt/openrobots:$CMAKE_PREFIX_PATH
```

## Use

There is tutorials-like examples in `/examples`.

In `src/o2r_pi2_controllers/robots_cfg` there is robot configurations that can help you understand the repo, or can be use as they are. `hunter.py` is accessible and runable.

## Overview
- `examples/` Tutorials to understand this package
- `src/o2r_pi2_controllers/manager/manager_casadi_model` Manager class for robot model handling
- `src/o2r_pi2_controllers/manager/manager_mpc_acados` Manager class for robot MPC solver handling
- `src/o2r_pi2_controllers/robots_cfg/` Robot configurations. hunter is a mobile base, where others are mobile manipulators.

## Contributors
- [**Rémi Porée**](https://github.com/Remi-Tortue)
- Martin Mujica
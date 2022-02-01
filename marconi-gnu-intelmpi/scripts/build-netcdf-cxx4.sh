#!/bin/bash

set -e

# NetCDF-CXX4
# Installed to the same directory as netcdf-c, because this makes it easier for BOUT++'s config
cd dependencies
DEPS_ROOT=$(pwd)

# Use github.com version for now, because CMake bug-fixes have not made it into
# the released version yet (should be able to use 4.3.2 when that comes out).
git clone git@github.com:Unidata/netcdf-cxx4.git
cd netcdf-cxx4
# Get known-good version (was master branch on 1/2/2022)
git checkout 6b1ae2666f2480a8ef7db6db56760834d912a9fa

cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$DEPS_ROOT/netcdf-build/ -DCMAKE_FIND_ROOT_PATH=$DEPS_ROOT/hdf5-build/
cmake --build build -j 16
cmake --install build

#!/bin/bash

set -e

# NetCDF
cd dependencies
DEPS_ROOT=$(pwd)
# CMake configuration is broken for the unidata.ucar.edu download, so use version from the repo on github.com instead
#wget https://downloads.unidata.ucar.edu/netcdf-c/4.8.1/src/netcdf-c-4.8.1.tar.gz
#tar xzf netcdf-c-4.8.1.tar.gz
wget https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.8.1.tar.gz
tar xzf v4.8.1.tar.gz

mkdir netcdf-build

cd netcdf-c-4.8.1

cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$DEPS_ROOT/netcdf-build/ -DCMAKE_FIND_ROOT_PATH=$DEPS_ROOT/hdf5-build/
cmake --build build -j 16
cmake --install build

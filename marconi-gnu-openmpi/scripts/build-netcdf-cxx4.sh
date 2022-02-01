#!/bin/bash

set -e

# NetCDF-CXX4
# Installed to the same directory as netcdf-c, because this makes it easier for BOUT++'s config
cd dependencies
DEPS_ROOT=$(pwd)

git clone git@github.com:Unidata/netcdf-cxx4.git
cd netcdf-cxx4
# Get known-good version (was master branch on 1/2/2022
git checkout 6b1ae2666f2480a8ef7db6db56760834d912a9fa

#CPPFLAGS="-I$DEPS_ROOT/hdf5-build/include -I$DEPS_ROOT/netcdf-build/include" LDFLAGS="-L$DEPS_ROOT/hdf5-build/lib/ -L$DEPS_ROOT/netcdf-build/lib/" ./configure --prefix=$DEPS_ROOT/netcdf-build
#make -j 16
#make install

cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$DEPS_ROOT/netcdf-build/ -DCMAKE_FIND_ROOT_PATH=$DEPS_ROOT/hdf5-build/
cmake --build build -j 16
cmake --install build

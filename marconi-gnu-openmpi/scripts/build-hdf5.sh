#!/bin/bash

set -e

# HDF5
cd dependencies
DEPS_ROOT=$(pwd)
#wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.1/src/hdf5-1.12.1.tar.bz2
#tar xjf hdf5-1.12.1.tar.bz2
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.13/hdf5-1.13.0/src/CMake-hdf5-1.13.0.tar.gz
tar xzf CMake-hdf5-1.13.0.tar.gz

#cd hdf5-1.12.1
#./configure --prefix $DEPS_ROOT/hdf5-build --enable-build-mode=production
#make -j 16
#make install

# For some reason, HDF5's cmake configuration has to be run from the build
# directory, not using a `-B build` (or whatever) argument
#mkdir hdf5-build
#cd hdf5-build
#cmake ../hdf5-1.12.1 -DCMAKE_BUILD_TYPE=Release -DHDF5_ENABLE_Z_LIB_SUPPORT=ON
#cmake --build . -j 16

cd CMake-hdf5-1.13.0/
./build-unix.sh
tar xzf HDF5-1.13.0-Linux.tar.gz

# Create a symbolic link to the built HDF5 directory, because HDF5 creates it at an insanely complicated path
cd $DEPS_ROOT
ln -s CMake-hdf5-1.13.0/HDF5-1.13.0-Linux/HDF_Group/HDF5/1.13.0/ hdf5-build

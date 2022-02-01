#!/bin/bash

set -e

# HDF5
cd dependencies
DEPS_ROOT=$(pwd)

# To configure with CMake, have to download a special tarball, not the standard source-code tarball
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.1/src/CMake-hdf5-1.12.1.tar.gz
tar xzf CMake-hdf5-1.12.1.tar.gz

# Weird build setup, see https://portal.hdfgroup.org/display/support/Building+HDF5+with+CMake
cd CMake-hdf5-1.12.1/
./build-unix.sh
tar xzf HDF5-1.12.1-Linux.tar.gz

# Create a symbolic link to the built HDF5 directory, because HDF5 creates it at an insanely complicated path
cd $DEPS_ROOT
ln -s CMake-hdf5-1.12.1/HDF5-1.12.1-Linux/HDF_Group/HDF5/1.12.1/ hdf5-build

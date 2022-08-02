#!/bin/bash
PATHPROJECT=$PWD
rm -rf /tmp/build_libhv
mkdir /tmp/build_libhv
cd /tmp/build_libhv
git clone https://github.com/ithewei/libhv.git
cd libhv
mkdir build
cd build
cmake ..
cmake --build .
sudo cp -r include/* $PATHPROJECT/include
sudo chown $USER:$USER $PATHPROJECT/include -R
sudo cp -r lib/libhv.so $PATHPROJECT/lib
sudo chown $USER:$USER $PATHPROJECT/lib -R
rm -rf /tmp/build_libhv
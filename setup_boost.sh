#!/bin/bash
sudo apt install libboost-all-dev
rm -rf /tmp/build_boost
mkdir /tmp/build_boost

PATHPROJECT=$PWD
cd /tmp/build_boost
wget https://boostorg.jfrog.io/artifactory/main/release/1.79.0/source/boost_1_79_0.zip
unzip boost_1_79_0.zip
cd boost_1_79_0/tools/build
./bootstrap.sh
sudo ./b2 install --prefix=$PATHPROJECT
cd /tmp/build_boost/boost_1_79_0
sudo b2 --build-dir=./build --prefix=$PATHPROJECT --with-filesystem --with-program_options --with-system --with-thread --with-date_time release install
sudo chown $USER:$USER $PATHPROJECT/lib -R
sudo chown $USER:$USER $PATHPROJECT/include -R
rm -rf /tmp/build_opencv
sudo rm -rf $PATHPROJECT/bin
sudo rm -rf $PATHPROJECT/share
#!/bin/bash

if [ $# != 1 ]; then
    echo "[ERROR] It must requires one parameter: "
    echo "         Path to be saved"
    echo "  ex) ./build /root"
    echo "  ex) ./build /home/user"
    exit
fi

NPB_VERSION=3.3.1
NPB_MAJOR_VERSION=$(echo $NPB_VERSION | awk '{ print substr($1,0,3) }')
PATH_TO_BE_SAVED=$1

ORIGIN_PATH=$(pwd)

cd /opt
if [ ! -f NPB${NPB_VERSION}.tar.gz ]; then
        wget https://www.nas.nasa.gov/assets/npb/NPB${NPB_VERSION}.tar.gz
	tar xvf NPB${NPB_VERSION}.tar.gz
fi
cd NPB${NPB_VERSION}/NPB${NPB_MAJOR_VERSION}-MPI/

rm -rf bin
mkdir bin
cp ${ORIGIN_PATH}/make.def ./config/
cp ${ORIGIN_PATH}/suite.def ./config/
make suite
mv ./bin NPB_bin && rm -rf ${PATH_TO_BE_SAVED}/NPB_bin && mv ./NPB_bin ${PATH_TO_BE_SAVED}/

echo "Sucessfully finished."

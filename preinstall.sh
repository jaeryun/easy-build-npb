#!/bin/bash

# This file was made to make "suite.def" file.
# Please make sure to run before "build.sh"

# Parameter checking
if [ $# == 0 ]; then	
    echo "[ERROR] There should be one or more parameters: "
    echo "         Benchmark Classes(S, W, A, B, C, D, E, F)"
    echo "  ex) ./preinstall B"
    echo "  ex) ./preinstall A B C D"
    exit
fi
for param in $@; do
	if [[ ! $param =~ [SWABCDEF] ]]; then
		echo "Error: invalid parameter -> $param"
		exit 1
	fi
done	

# Required file checking
if [ ! -e base_suite.def ]; then
	echo 'Error: Cannot find "base_suite.def" files'
	exit 1
fi

if [ -e ./suite.def ]; then
        rm -rf ./suite.def
fi

touch suite.def
for WORKLOAD_TYPE in $@; do
        sed -e s/wt/${WORKLOAD_TYPE}/g base_suite.def >>suite.def 
done
echo 'The "suite.def" file creation was successfully completed.'


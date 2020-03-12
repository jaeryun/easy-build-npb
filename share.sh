#!/bin/bash

# Parameter checking
if [ $# == 0 ]; then
    echo "[ERROR] There should be two or more parameters: "
    echo "         1. Path where NPB is stored"
    echo "         2~n. hostnames to be shared"
    echo "  ex) ./share.sh /root/NPB_bin vm1"
    echo "  ex) ./shared.sh /home/user vm1 vm2 vm3"
    exit
fi

SAVED_PATH=$1
NODES=""
for param in $@; do
	if [ param == $1 ]; then
		continue
	fi
	NODES="${NODES} ${param}"
done

for node in ${NODES}; do
        ssh root@${node} rm -rf ${SAVED_PATH}/NPB_bin
        scp -r ${SAVED_PATH}/NPB_bin root@${node}:${SAVED_PATH}/
done

exit

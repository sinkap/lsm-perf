#!/bin/bash

set -e

cd `dirname "${BASH_SOURCE[0]}"`


if [[ $# -ne 2 ]]; then
	echo "Usage: $0 <iterations> <output>"
	exit 1
fi

ITERATIONS=${1:?}
echo "Running ${ITERATIONS} iterations"

for i in `seq 1 ${ITERATIONS}`; do
	taskset -c 3 ./eventfd >> $2
done

#!/bin/bash

echo "Downloading, this might take a while..."
aria2c --max-concurrent-downloads=3 --max-connection-per-server=16 \
    --split=16 --min-split-size=1M --disk-cache=64M --file-allocation=none \
    --continue --disable-ipv6=true --connect-timeout=60 --max-tries=5 --retry-wait=5 \
    --summary-interval=120 --input-file=/links.txt \

if [ ! -f libtcmalloc_minimal.so.4 ]; then
    aria2c -o libtcmalloc_minimal.so.4 \
    https://github.com/camenduru/gperftools/releases/download/v1.0/libtcmalloc_minimal.so.4
else
    echo "libtcmalloc_minimal.so.4 already exists, skipping download."
fi
#!/bin/bash

echo "Downloading, this might take a while..."
pip install aria2
aria2c aria2c --console-log-level=error -c -x 16 -s 16 -k 1M --input-file=/home/studio-lab-user/Sagemarker-Reforge/links.txt

# if [ ! -f libtcmalloc_minimal.so.4 ]; then
#     aria2c -o libtcmalloc_minimal.so.4 \
#     https://github.com/camenduru/gperftools/releases/download/v1.0/libtcmalloc_minimal.so.4
# else
#     echo "libtcmalloc_minimal.so.4 already exists, skipping download."
# fi
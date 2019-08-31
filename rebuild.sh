#!/bin/bash

# a little script to rebuild the package in your working directory

rm -f cscope.*
./autogen.sh
./configure.sh
make clean
make V=0 cscope
cscope -b
make V=0 -j$(($(nproc 2>/dev/null||echo 4)<<1)) clean all README

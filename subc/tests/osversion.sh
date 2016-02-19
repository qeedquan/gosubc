#!/bin/sh

grep "^#define.*`uname`_[Vv]ersion" /usr/include/sys/param.h | awk '{print $3}' 

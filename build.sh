#!/bin/bash

set -x -e

DEVICE_TREE=stm32mp157-somic
BUILD_DIR=build-$DEVICE_TREE

rm -rf $BUILD_DIR
make mrproper
export KBUILD_OUTPUT=$BUILD_DIR
make stm32mp157_somic_defconfig
make -j8 CROSS_COMPILE=arm-linux-gnueabihf- DEVICE_TREE=$DEVICE_TREE all
unset KBUILD_OUTPUT

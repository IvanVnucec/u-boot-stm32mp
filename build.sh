#!/bin/bash

set -x -e

DEVICE_TREE=stm32mp157-somic
DEFCONFIG=stm32mp157_somic_defconfig
BUILD_DIR=build

rm -rf $BUILD_DIR
make mrproper
export KBUILD_OUTPUT=$BUILD_DIR
make $DEFCONFIG
make -j8 CROSS_COMPILE=arm-linux-gnueabihf- DEVICE_TREE=$DEVICE_TREE all
unset KBUILD_OUTPUT

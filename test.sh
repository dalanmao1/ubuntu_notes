#!/usr/bin/env bash


readlink -f ${BASH_SOURCE}
SCRIPT_FULL_PATH=$(readlink -f ${BASH_SOURCE})
echo $SCRIPT_FULL_PATH

echo_banner_begin ${SCRIPT_FULL_PATH}
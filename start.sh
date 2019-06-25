#!/bin/bash
# This script starts a Unturned 3 server on Linux machines
# To start servers with this script, place it next to Unturned.exe
# Syntax: start.sh <instance name>
# Author: fr34kyn01535

export MONO_IOMAP=all

#CONFIG
INSTANCE_NAME=$1
STEAMCMD_HOME="$PWD/Steam_CMD"
UNTURNED_HOME="$PWD/Unturned_Server"

#COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLLOW='\033[0;33m'
NC='\033[0m'

#Steam checks
STEAMCMD_API=$STEAMCMD_HOME/linux64/steamclient.so
UNTURNED_API=$UNTURNED_HOME/Unturned_Headless_Data/Plugins/x86_64/steamclient.so
printf "Steam: "
if [ -f $STEAMCMD_API ]; then
	if diff $STEAMCMD_API $UNTURNED_API >/dev/null ; then
		printf "${GREEN}UP TO DATE${NC}\n\n"
	else
		cp $STEAMCMD_API $UNTURNED_API
		printf "${YELLLOW}UPDATING${NC}\n\n"
	fi
else
	printf "${RED}NOT FOUND${NC}\n\n"
fi

cd $UNTURNED_HOME

if [ -f RocketLauncher.exe ]; then
	ulimit -n 2048
	export LD_LIBRARY_PATH=$UNTURNED_HOME/lib:$LD_LIBRARY_PATH
	mono RocketLauncher.exe $INSTANCE_NAME
else
	echo "RocketLauncher not found."
fi

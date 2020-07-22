#!/bin/bash

# This is a modified server-helper script full credit goes to Nelson

# To mark this script as executable you may need to run "chmod +x ServerHelper.sh"

# Unity will load the steamclient file from the plugins directory, so we copy it there.
# As of 2020-05-14 there are crashes with the official redist version that do not seem
# to be present in the steamcmd version, so we use that instead if available.
redist_steamclient=linux64/steamclient.so
steamcmd_steamclient=../../../linux64/steamclient.so
unturned_steamclient=Unturned_Headless_Data/Plugins/x86_64/steamclient.so
if [[ -f $steamcmd_steamclient ]]
then
    cp -f $steamcmd_steamclient $unturned_steamclient
else
    cp -f $redist_steamclient $unturned_steamclient
fi

# Tell system where to find the steamclient.so we just copied. Without this
# command API Init will fail with an unable to find file error.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/Unturned_Headless_Data/Plugins/x86_64/

# Terminal mode compatible with -logfile 2>&1 IO.
export TERM=xterm

# Run the server binary.
# -batchmode and -nographics are Unity player arguments.
# -logfile 2>&1 can be used to pipe IO to/from the terminal.
# "$@" appends any command-line arguments passed to this script.
./Unturned_Server/Unturned_Headless.x86_64 -batchmode -nographics -ThreadedConsole +LanServer/"$@"

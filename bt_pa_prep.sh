#!/bin/bash

#--------------------------------------------------------------------
function tst {
    echo "===> Executing: $*"
    if ! $*; then
        echo "Exiting script due to error from: $*"
        exit 1
    fi	
}
#--------------------------------------------------------------------


# Update
tst sudo apt-get update -y

# Upgrade the distro
tst sudo apt-get upgrade -y

echo "Done! You should reboot now"

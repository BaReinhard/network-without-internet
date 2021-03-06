#!/bin/bash
# Must be run as Root, i.e. sudo ./runall.sh
log="./runall.log"
echo "" > $log

read -p "Device name: " MYNAME
read -p "Device WiFi Password: " WIFIPASS

#--------------------------------------------------------------------
function tst {
    echo "===> Executing: $*"
    if ! $*; then
        echo "Exiting script due to error from: $*"
        exit 1
    fi
}
#--------------------------------------------------------------------
chmod +x ./*
echo "Starting @ `date`" | tee -a $log
echo "--------------------------------------------" | tee -a $log
tst ./ap_prep.sh | tee -a $log
echo "--------------------------------------------" | tee -a $log
tst ./ap_install.sh | tee -a $log
echo "--------------------------------------------" | tee -a $log
{ echo "${MYNAME}"; echo "${WIFIPASS}";} | tst ./ap_config.sh | tee -a $log
echo "--------------------------------------------" | tee -a $log
echo "Ending at @ `date`" | tee -a $log


#!/bin/sh

# init hosts and run test test/test_<measurementhost>.sh on measurement host

if test "$#" -ne 2; then
        echo "Usage: all.sh measurementhost switchhost"
        exit
fi

echo "[Info]\tStart init: " `date "+%Y-%m-%d %H:%M:%S"`

# Init
./init.sh $1 $2

echo "[Info]\tInit complete: " `date "+%Y-%m-%d %H:%M:%S"`
echo "[Info]\tStart tesrun: " `date "+%Y-%m-%d %H:%M:%S"`

# Test
./testrun.sh $1 $2

echo "[Info]\tTestrun complete: " `date "+%Y-%m-%d %H:%M:%S"`

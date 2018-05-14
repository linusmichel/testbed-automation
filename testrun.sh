#!/bin/sh

# run test testrun/testrun_<measurementhost>.sh on measurementhost without init

if test "$#" -ne 2; then
        echo "Usage: testrun.sh measurementhost switchhost"
        exit
fi

# Test hosts already initialized

# Test
echo "[Info]\tStart test"
pos nodes cmd --infile testrun/testrun_${1}.sh "$1" > log/testrunlog_${1}.txt
echo "[Info]\tTest completed"

# Copy Test results
./copy_results.sh ${1}

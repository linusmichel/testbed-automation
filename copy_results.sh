#!/bin/sh

# Copy test results of measurementhost

if test "$#" -ne 1; then
        echo "Usage: copy_results.sh measurementhost"
        exit
fi

# Test hosts already initialized
# Test already done

# Copy results
DATE=`date "+%Y-%m-%d_%H:%M:%S"`
RESULTDIR="../results/${DATE}"
mkdir -p ${RESULTDIR}

# Copy Results
echo "[Info]\tCopy test results"
cp log/testrunlog_${1}.txt ${RESULTDIR}
scp -r ${1}:/root/results/ ${RESULTDIR}/
mkdir -p ${RESULTDIR}/sdn-cert
scp -r ${1}:/root/sdn-cert/results/ ${RESULTDIR}/sdn-cert/
scp ${1}:/root/sdn-cert/sdn-cert.log ${RESULTDIR}/sdn-cert/
echo "[Info]\tTest results copied to ${RESULTDIR}"

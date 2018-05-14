#!/bin/sh

if test "$#" -ne 2; then
	echo "Usage: init.sh measurementhost switchhost"
	exit
fi

OSIMAGE=debian-stretch

echo "[Info]\tInitialize hosts ..."

echo "[Info]\tfree hosts (-force!)"
pos allocations free --force "$1"
pos allocations free --force "$2"

echo "[Info]\tallocate hosts"
pos allocations allocate "$1" "$2"

echo "[Info]\tset images to debian stretch"
pos nodes image "$1" ${OSIMAGE}
pos nodes image "$2" ${OSIMAGE}

echo "[Info]\treboot experiment hosts..."
# run reset blocking in background and wait for processes to end before continuing
{ pos nodes reset "$1"; echo "[Info]\t$1 booted successfully"; } &
{ pos nodes reset "$2"; echo "[Info]\t$2 booted successfully"; } &
wait

echo "[Info]\tpreparing experiment hosts..."
./config/1_preparation/preparation_measurement.sh ${1}
./config/1_preparation/preparation_switch.sh ${2}
echo "[Info]\texperiment hosts prepared"

echo "[Info]\trun installation scripts..."
mkdir -p log 2>&1
# run scripts in background and wait for processes to end before continuing
{ pos nodes cmd --infile config/2_before_standard/before_${1}.sh "$1" > log/installationlog_${1}.txt; pos nodes cmd --infile config/3_standard/standard_measurement.sh "$1" >> log/installationlog_${1}.txt; pos nodes cmd --infile config/4_after_standard/after_${1}.sh "$1" >> log/installationlog_${1}.txt; echo "[Info]\t$1 installation done"; } &
{ pos nodes cmd --infile config/2_before_standard/before_${2}.sh "$2" > log/installationlog_${2}.txt; pos nodes cmd --infile config/3_standard/standard_switch.sh "$2" >> log/installationlog_${2}.txt; pos nodes cmd --infile config/4_after_standard/after_${2}.sh "$2" >> log/installationlog_${2}.txt; echo "[Info]\t$2 installation done"; } &
wait

echo "[Info]\tInitialization complete"

#!/bin/bash

if [ "$1" == "" ] && [ "$2" == "" ]
then
echo "Two strings don't exists!"
exit
fi

find . -type f -exec \
    sed -i 's/${1}/${2}/g' {} +
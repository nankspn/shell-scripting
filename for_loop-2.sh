#!/bin/bash

cd test
for file in $(ls);
do
    echo line count of $file is $(cat $file | wc -l)
done
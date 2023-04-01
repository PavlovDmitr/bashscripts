#!/bin/bash

if [[ -n $1 ]]
then
        if [[ -d $1 ]]
        then
                directory=$1
        else
                echo "Директория не существует!"
                exit
        fi
else
directory=$(pwd)

fi
echo $directory
ls $directory >> 1.bak
for file in $( ls $directory | grep -e '.bak\>' -e '.tmp\>' -e '.backup\>' )
do
        echo "Удаляем: $file"
        rm $file
done
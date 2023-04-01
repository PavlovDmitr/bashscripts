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
for file in $(ls $directory)
do
        if [[ -d $file ]]
        then
                continue
        else
                IFS=' ' read -ra words_array <<< "$(ls -l | grep -w $file)"
                owner=${words_array[2]}
        echo $owner
                if [[ -d $owner ]]
                then
                        cp -p $file "$owner/"
                         #если запускать скрипт не от root то...
                else
                        mkdir $owner
                        cp -p $file "$owner/"
                fi
        fi
done
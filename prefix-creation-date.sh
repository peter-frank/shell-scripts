#!/bin/bash
# fügt einen datumsprefix zu *.gz dateien
for file in *.gz
do
 newfile=$(date "+%Y-%m-%d-%H:%M-$file" -d "$(stat -c "%y" $file)")
 mv "$file" "$newfile"
done

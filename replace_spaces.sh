#!/bin/bash
#entfernt alle spaces im Filenamen
ls | while read -r FILE
do
    mv -v "$FILE" `echo $FILE | tr ' ' '_' `
done

#!/bin/bash
# korrigiert den namen aller files mit typ $1 - command line arg
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
fi
type=$(echo "$1" | awk '{print tolower($1)}')
for f in $(find . -iname '*.'$type);
do
echo "move file: ${f} to directory: /home/peter/Bilder/RenamedPics/" >> /var/log/myscripts/pic.log
mv -n "$f" "$(exiftool -d "%Y-%m-%d_%H%M%S" -CreateDate "$f" | awk '{print "/home/peter/Bilder/RenamedPics/"$4"."}')$type"
done

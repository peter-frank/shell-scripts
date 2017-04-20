#!/bin/bash
nas="/media/peter/usb_backup/PIC-SYNC-NAS"
if [[ ! -d "$nas" ]] ; then
    echo "$nas Directory not mounted"
    exit 1
fi
for file in *.jpg *.JPG;
do
if [ ! -f "$file" ]; then
	echo " ${file} not existing"
	continue
fi
year=${file:0:4}
directory_name=$nas/$year/${file:5:2}

echo "move file: ${file} to directory: ${directory_name}" >> /var/log/myscripts/pic.log
mkdir -p  "$directory_name"
mv "${file}" "$directory_name"
done
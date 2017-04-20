#!/bin/bash
# verschiebt korrekt benamte jpegs ins nas backup
nas="/media/peter/usb_backup/PIC-SYNC-NAS"
from="/home/peter/Bilder/RenamedPics/"
move-to-default-with-args.sh jpg
move-to-default-with-args.sh mov
move-to-default-with-args.sh mp4
if [[ ! -d "$nas" ]] ; then
    echo "$nas Directory not mounted"
    exit 1
fi
for file in $(find $from -iname '*.*');
do
if [ ! -f "$file" ]; then
	echo " ${file} not existing"
	continue
fi
filename=$(basename "$file")
echo $filename
year=${filename:0:4}
directory_name=$nas/$year/${filename:5:2}

echo "move file: ${file} to directory: ${directory_name}" >> /var/log/myscripts/pic.log
mkdir -p  "$directory_name"
cp "${file}"  "/home/peter/Bilder/backup/${filename}"
mv "${file}" "$directory_name"
done
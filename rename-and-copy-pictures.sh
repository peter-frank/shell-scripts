#!/bin/bash
for f in $(find . -name '*.jpg' -or -name '*.JPG');
do
cp -n "$f" "$(exiftool -d "%Y-%m-%d_%H%M%S" -CreateDate "$f" | awk '{print "/media/peter/usb_backup/PIC-SYNC-NAS/2017/"$4".jpg"}')"
done

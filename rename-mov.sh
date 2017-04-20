#!/bin/bash
for f in $(find . -name '*.mov' -or -name '*.MOV');
do
mv -n "$f" "$(exiftool -d "%Y-%m-%d_%H%M%S" -CreateDate "$f" | awk '{print "/media/peter/usb_backup/PIC-SYNC-NAS/2017/"$4".mov"}')"
done

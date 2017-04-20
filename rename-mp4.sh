#!/bin/bash
for f in $(find . -name '*.mp4' -or -name '*.MP4');
do
mv -n "$f" "$(exiftool -d "%Y-%m-%d_%H%M%S" -CreateDate "$f" | awk '{print "/media/peter/usb_backup/PIC-SYNC-NAS/2017/"$4".mp4"}')"
done

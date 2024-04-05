#!/bin/sh
while true; do
	case $(date +%H) in
		00 | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09)
			wbg $1
			;;
		10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18)
			wbg $2
			;;
		19 | 20 | 21 | 22 | 23) # 5 hour hell
			wbg $3
			;;
	esac
	secondsuntilhour=$((3600 - $(date +%M)*60 - $(date +%S)))
	sleep $secondsuntilhour
done

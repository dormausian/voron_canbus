#!/bin/sh

# Directories and files
KLIPPYLOG="$HOME/printer_data/logs/klippy.log"
ADC="Klipper Log Not Found"

prepout() {
	echo
	echo "================================================================";
	echo $1;
	echo "================================================================\n";
	# shift the first array entry $1 (Header) and iterate through remaining 
	shift
	for var in "$@"; do echo "$var\n"; done
}

#######################################

# Retrieving info from klippy.log
if [ -f $KLIPPYLOG ]; then
	# ADC temp check
	MIN_TEMP=-10
	MAX_TEMP=400
	ADC=$(tac $KLIPPYLOG | grep -m 1 "^Stats" | sed 's/\([a-zA-Z0-9_.]*\)\:/\n\1:/g' |
		awk -v mintemp="$MIN_TEMP" -v maxtemp="$MAX_TEMP" '/temp=/ {
			printf "%18s ", $1;
			j=0;
			for (i=2; i<=split($0, stat, " "); i++) {
				if (sub(/^.*temp=/, "", stat[i])) {
					printf "%6s", stat[i];
					if (stat[i] + 0 < mintemp ) {
						printf "%s", "    *** Check Sensor ***";
					} else if (stat[i] + 0 > maxtemp) {
						printf "%s", "    *** Check Sensor ***";
					}
					j++;
					break;
				}
			}
			printf "\n";
		} END { if (j == 0) { printf "No Temperature Data Available\n"; } }'
	)
fi

echo "$(prepout "Temperature Check" "${ADC}")\n"

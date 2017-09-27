#!/bin/bash

# exec >& $0.log

FILENAME=`mktemp -p /tmp tmp.XXXXXX.png`
function finish {
  rm -rf $FILENAME
}
trap finish EXIT

case $1 in
	all)
		scrot -u $FILENAME
		xclip -selection clipboard -t image/png < $FILENAME
		;;
	win|window)
		# WORKAROUND:
		# https://stackoverflow.com/questions/35500163/bash-script-with-scrot-area-not-working
		sleep 0.2
		scrot -s $FILENAME
		xclip -selection clipboard -t image/png < $FILENAME
		;;
	sel|select|selection)
		scrot -s $FILENAME
		xclip -selection clipboard -t image/png < $FILENAME
		;;
	*)
		;;
esac

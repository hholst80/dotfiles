#!/bin/bash

case $1 in
	win|window)
		maim -u -i $(xdotool selectwindow) | xclip -selection clipboard -t image/png
		;;
	sel|select|selection)
		maim -u -s | xclip -selection clipboard -t image/png
		;;
	*)
		;;
esac

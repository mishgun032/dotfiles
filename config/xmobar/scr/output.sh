default="`pactl get-default-sink`"

if [ "$default" == 'alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo' ]; then
	echo 'HyperX'
else
	echo 'Kalonshi'
fi


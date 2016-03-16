#!/bin/bash
option=$1
zone=$2
value=$3

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/0/dbus/user_bus_socket

if [[ $option = "set" ]]; then
	echo "set $2 to $3"
	dbus-send --session --reply-timeout=120000 --type=method_call --dest='com.jaguarlandrover.HVAC' '/' local.HVAC_rvi_vtc1010.dbushelper.set_value string:$2 double:$3
elif [[ $option = "get" ]]; then
	echo "get $2"
	dbus-send --session --print-reply --reply-timeout=120000 --type=method_call --dest='com.jaguarlandrover.HVAC' '/' local.HVAC_rvi_vtc1010.dbushelper.get_value string:$2 
elif [[ $option = "help" ]]; then
	echo ""
	echo "HELP!"
	echo "To set a value: send_dbus.sh set <element> <value>"
	echo "To get a value: send_dbus.sh get <element>"
	echo ""
	echo "Elements (values):"
	echo "	leftTemperature (15 - 30)"
	echo "	rightTemperature (15 - 30)"
	echo "	leftSeatHeat (0 - 3)"
	echo "	rightSeatHeat (0 - 3)"
	echo "	fanSpeed (0 - 1)"
	echo "	fanDown (0 - 1)"
	echo "	fanRight (0 - 1)"
	echo "	fanUp (0 - 1)"
	echo "	fanAC (0 - 1)"
	echo "	fanAuto (0 - 1)"
	echo "	fanRecirc (0 - 1)"
	echo "	defrostMax (0 - 1)"
	echo "	defrostRear (0 - 1)"
	echo "	defrostFront (0 - 1)"
 	echo ""
 	echo ""
 	echo ""
else
	echo "argument error, see: send_dbus.sh help"
fi

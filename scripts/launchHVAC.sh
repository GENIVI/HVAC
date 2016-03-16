#!/bin/bash
#pkill -f HVAC_rvi_vtc1010
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/0/dbus/user_bus_socket
/opt/HVAC_rvi_vtc1010/bin/HVAC_rvi_vtc1010 &
sleep 1 
/home/root/showQML.sh
read x

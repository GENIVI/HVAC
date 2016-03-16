## **GDP HVAC app with dbus interface v1.0**

The app is a port of AGL HVAC app demo for CES 2016 found here:
`https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/DemoApps/CES2016.git;a=summary`

The app also includes a dbus interface to broadcast over dbus the changes made in the gui and set/retrieve property values from dbus

### Set property value from dbus
To **set** the value of any property from dbus, you need to call the dbus method
`set_value(property, newvalue)`. Where property is one of the property names described in the property list in this document

**Example: **
`$ dbus-send --session --reply-timeout=120000 --type=method_call --dest='com.jaguarlandrover.HVAC' '/' local.HVAC_rvi_vtc1010.dbushelper.set_value string:"leftTemperature" double:22`

This will set the `leftTemperature` property to 22 degrees.

Alternatively you can use a program with GUI (e.g d-feet) to make this step easier

### Get property value from dbus
To **get** the value of any property from dbus, you need to call the dbus method
`get_value(property)`. Where property is one of the property names described in the property list in this document

**Example: **
`$ dbus-send --session --print-reply --reply-timeout=120000 --type=method_call --dest='com.jaguarlandrover.HVAC' '/' local.HVAC_rvi_vtc1010.dbushelper.get_value string:"leftTemperature" `
`22`
This returns the `leftTemperature` property value, in this case, it is 22 degrees.

### Writing GUI changes to dbus

The app will automatically write a dbus message every time a property is changed that includes the name of the property and the new value.

**Example dbus message: **
`signal sender=:1.31 -> dest=(null destination) serial=296 path=/; interface=qml.sink; member=QmlSignal`
   `string "leftTemperature"`
   `double 22`
This means that `leftTemperature` property has changed to value 22



### List of properties

| Property name | Range of valid values |
|--------------|-----------------------|
| leftTemperature | (15 - 30) |
| rightTemperature | (15 - 30) |
| leftSeatHeat | (0 - 3) |
| rightSeatHeat | (0 - 3) |
| fanSpeed | (0 - 1) |
| fanDown | (0 - 1) |
| fanRight | (0 - 1) |
| fanUp | (0 - 1) |
| fanAC | (0 - 1) |
| fanAuto | (0 - 1) |
| fanRecirc | (0 - 1) |
| defrostMax | (0 - 1) |
| defrostRear | (0 - 1) |
| defrostFront | (0 - 1) |

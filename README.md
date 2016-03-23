# **GDP HVAC app with dbus interface v1.0**

The app is a port of AGL HVAC app demo for CES 2016 found here:    
`https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/DemoApps/CES2016.git;a=summary`

The app also includes a dbus interface to broadcast over dbus the changes made in the gui and set/retrieve property values from dbus.

## **Running it in a VTC1010 with GDP**     
You should follow these instructions compiled by tjamison@jaguarlandrover.com:

1. Build your GDP image (confirm you have a meta-qt5 layer... haven't run into an issue with this so far)
2. Build the sdk: `bitbake meta-qt5-toolchain` (note: GDP offers their own SDK, I have not succeeded in getting this running because their documentation is gappy. Not sure what the difference is, if any)
3. Install the sdk. This will be in the output directory of your build environment -- in mine, it's: `./tmp/deploy/sdk/oecore-x86_64-corei7-64-toolchain-nodistro.0.sh`
4. Confirm that the SDK installed successfully by running qmake ​*for your target device sysroot*​: on my ​*host device*​, I test this by running: `/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/qt5/qmake`. If you get info about QMake modes, it installed successfully.
5. Configure qtcreator by sourcing the environment variables: ` . /usr/local/oecore-x86_64/environment-setup-corei7-64-poky-linux` (your ​*filename*​ may be different, but the directory should be the same)
6. Launch qtcreator ​*from the same shell where you sourced your environment variables*​. The executable lives in the /Tools/QtCreator subdirectory of your Qt installation path (version-agnostic)... So on my platform, it lives at `/home/tjamison/opt/Qt/Tools/QtCreator/bin/qtcreator`. I created a small executable that sources the environment variables & launches qtcreator and just added it to my PATH

Note that #3 is the `./` of executing, and #5 is the `.[whitespace]/` that is the bash-independent method to `source` a file    

Once you've launched qtcreator, you'll need to configure your device. The toradex page covers that pretty well, but the ​*additional*​ note is that, when you open a project, you need to replace the `qmake` executable in the build tab of the project settings with a `custom process step` to run qmake, so that it will actually use the embedded compiler that you specified     

To launch it from QTCreator you should configure it to cross compile as explained here:     
`http://developer.toradex.com/knowledge-base/how-to-set-up-qt-creator-to-cross-compile-for-embedded-linux#Build_the_SDK_for_Qt_development`     

You need also to copy the imports folder contents into the QML install directory, in my case: `/usr/lib/qt5/qml/`     

To show the app in top of the GDP launcher you can use the showQML.sh script in the scripts folder

## **Set property value from dbus**
To **set** the value of any property from dbus, you need to call the dbus method
`set_value(property, newvalue)`. Property names and valid ranges for new values can be found in the property list.

**Example**    
`$ dbus-send --session --reply-timeout=120000 --type=method_call --dest='com.jaguarlandrover.HVAC' '/' local.HVAC_rvi_vtc1010.dbushelper.set_value string:"leftTemperature" double:22`

This will set the `leftTemperature` property to 22 degrees.

Alternatively you can use a program with GUI (e.g d-feet) to make this step easier.

## **Get property value from dbus**
To **get** the value of any property from dbus, you need to call the dbus method
`get_value(property)`. Property names can be found in the property list.

**Example**    
`$ dbus-send --session --print-reply --reply-timeout=120000 --type=method_call --dest='com.jaguarlandrover.HVAC' '/' local.HVAC_rvi_vtc1010.dbushelper.get_value string:"leftTemperature" `    
`22`    

This returns the `leftTemperature` property value, in this case, it is 22 degrees.

## **Writing GUI changes to dbus**

The app will automatically write a dbus message every time a property is changed that includes the name of the property and the new value.

**Example dbus message**    
`signal sender=:1.31 -> dest=(null destination) serial=296 path=/; interface=qml.sink; member=QmlSignal`     
   `string "leftTemperature"`    
   `double 22`    

This means that `leftTemperature` property has changed to value 22.



## **List of properties**

| **Property name** | **Range of valid values** |
|--------|--------|
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

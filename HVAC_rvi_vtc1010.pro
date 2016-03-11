TEMPLATE = app

QT += qml quick dbus
CONFIG += c++11

SOURCES += main.cpp \
    dbushelper.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += \
    com/ \
    com/jlr/dbus/ \
    apps/ \
    imports/ \
    imports/system \
    imports/vehicle

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    images/news_app_icon.png \
    images/Hex-Background.jpg \
    apps/Home/images/HomeHex.png \
    apps/HVAC/images/defrost_front_off.png \
    apps/HVAC/images/defrost_front_on.png \
    apps/HVAC/images/defrost_max_off.png \
    apps/HVAC/images/defrost_max_on.png \
    apps/HVAC/images/defrost_rear_off.png \
    apps/HVAC/images/defrost_rear_on.png \
    apps/HVAC/images/fan_bar_off.png \
    apps/HVAC/images/fan_bar_on.png \
    apps/HVAC/images/fan_control_ac_off.png \
    apps/HVAC/images/fan_control_ac_on.png \
    apps/HVAC/images/fan_control_auto_off.png \
    apps/HVAC/images/fan_control_auto_on.png \
    apps/HVAC/images/fan_control_circ_off.png \
    apps/HVAC/images/fan_control_circ_on.png \
    apps/HVAC/images/fan_dir_down_off.png \
    apps/HVAC/images/fan_dir_down_on.png \
    apps/HVAC/images/fan_dir_right_off.png \
    apps/HVAC/images/fan_dir_right_on.png \
    apps/HVAC/images/fan_dir_up_off.png \
    apps/HVAC/images/fan_dir_up_on.png \
    apps/HVAC/images/fan_icon_off.png \
    apps/HVAC/images/hazard_blink.png \
    apps/HVAC/images/hazard_off.png \
    apps/HVAC/images/hazard_on.png \
    apps/HVAC/images/left_heat_seat_off.png \
    apps/HVAC/images/left_heat_seat_on.png \
    apps/HVAC/images/right_heat_seat_off.png \
    apps/HVAC/images/right_heat_seat_on.png \
    apps/HVAC/images/separator.png \
    images/dashboard/Fuel_Icon.png \
    images/dashboard/Full_Fuel_Gauge.png \
    images/dashboard/Full_Speed_Gauge.png \
    images/dashboard/Speed_Icon.png \
    images/dashboard/Status_OK.png \
    images/dashboard/Temperature_Icon.png \
    images/AGL-Logo.png \
    images/AppHex.png \
    images/application_grid.png \
    images/backspace_icon.png \
    images/blank_hexagon.png \
    images/browser_app_icon.png \
    images/bt_close.png \
    images/cameras_app_icon.png \
    images/dashboard_app_icon.png \
    images/fingerprint_app_icon.png \
    images/fmradio_app_icon.png \
    images/googlemaps_app_icon.png \
    images/homescreen_icon.png \
    images/hvac_app_icon.png \
    images/icon_apps_blue.png \
    images/icongear.png \
    images/JLR-Logo.png \
    images/media_player_app_icon.png \
    images/nfc_app_icon.png \
    images/phone_app_icon.png \
    images/settings_icon.png \
    images/shift_off_icon.png \
    images/shift_on_icon.png \
    images/space_bar_icon.png \
    images/switchcontrol.png \
    images/switchplate_off.png \
    images/switchplate_on.png \
    images/symbols_icon.png \
    images/symbols_off_icon.png \
    images/tizen.png \
    images/weather_app_icon.png \
    images/white_return.png

HEADERS += \
    dbushelper.h



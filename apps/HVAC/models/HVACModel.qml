/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0
import vehicle 1.0
import Dbushelper 1.0

Item {
    property bool fanUp: false
    property bool fanRight: false
    property bool fanDown: false

    property bool fanAC: false
    property bool fanAuto: false
    property bool fanRecirc: false

    property real fanSpeed: 0

    property bool defrostMax: false
    property bool defrostFront: false
    property bool defrostRear: false

    property double leftTemperature: 0
    property double rightTemperature: 0

    property int leftSeatHeat: 0
    property int rightSeatHeat: 0

    onFanSpeedChanged: {
//        var currentFan = ClimateModel.getRangeValue(fanSpeed,ClimateModel.fanStepSize);
        myDbus.QML_value("fanSpeed", fanSpeed*100)
    }

    onLeftTemperatureChanged: {
//        var temperature = ClimateModel.getRangeValue(leftTemperature,ClimateModel.temperatureStepSize);
        myDbus.QML_value("leftTemperature", leftTemperature*15+15)
    }

    onRightTemperatureChanged: {
//        var temperature = ClimateModel.getRangeValue(rightTemperature,ClimateModel.temperatureStepSize);
        myDbus.QML_value("rightTemperature", rightTemperature*15+15)
    }

    onLeftSeatHeatChanged: {
        myDbus.QML_value("leftSeatHeat", leftSeatHeat)
    }

    onRightSeatHeatChanged: {
        myDbus.QML_value("rightSeatHeat", rightSeatHeat)
    }
    onFanACChanged: {
        myDbus.QML_mode("fanAC", fanAC)
    }
    onFanRightChanged: {
        myDbus.QML_mode("fanRight", fanRight)
    }
    onFanDownChanged: {
        myDbus.QML_mode("fanDown", fanDown)
    }
    onFanUpChanged: {
        myDbus.QML_mode("fanUp", fanUp)
    }
    onFanAutoChanged: {
        myDbus.QML_mode("fanAuto", fanAuto)
    }
    onFanRecircChanged: {
        myDbus.QML_mode("fanRecirc", fanRecirc)
    }
    onDefrostMaxChanged: {
        myDbus.QML_mode("defrostMax", defrostMax)
    }
    onDefrostRearChanged: {
        myDbus.QML_mode("defrostFront", defrostFront)
    }
    onDefrostFrontChanged: {
        myDbus.QML_mode("defrostRear", defrostRear)
    }




    Dbushelper{
        id: myDbus
        onLeftTemperature_changed: {
            parent.leftTemperature=(myDbus.get_value("leftTemperature")-15.0)/15.0
        }
        onRightTemperature_changed: {
            parent.rightTemperature=(myDbus.get_value("rightTemperature")-15.0)/15.0
        }
        onFanSpeed_changed: {
            parent.fanSpeed=myDbus.get_value("fanSpeed")/100.0
        }
        onFanAC_changed: {
            parent.fanAC=myDbus.get_value("fanAC")
        }
        onLeftSeatHeat_changed: {
            parent.leftSeatHeat=myDbus.get_value("leftSeatHeat")
        }
        onRigthSeatHeat_changed: {
            parent.rightSeatHeat=myDbus.get_value("rightSeatHeat")
        }
        onFanRight_changed: {
            parent.fanRight=myDbus.get_value("fanRight")
        }
        onFanDown_changed: {
            parent.fanDown=myDbus.get_value("fanDown")
        }
        onFanUp_changed: {
            parent.fanUp=myDbus.get_value("fanUp")
        }
        onFanAuto_changed: {
            parent.fanAuto=myDbus.get_value("fanAuto")
        }
        onFanRecirc_changed: {
            parent.fanRecirc=myDbus.get_value("fanRecirc")
        }
        onDefrostMax_changed: {
            parent.defrostMax=myDbus.get_value("defrostMax")
        }
        onDefrostRear_changed: {
            parent.defrostFront=myDbus.get_value("defrostFront")
        }
        onDefrostFront_changed: {
            parent.defrostRear=myDbus.get_value("defrostRear")
        }

    }
}

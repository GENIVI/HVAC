/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import utils 1.0
import "models"
//import com.jlr.dbus 1.0
import Dbushelper 1.0


App {
    appId: "hvac"

    Dbushelper{
        id: myDbus
        onTemp_leftSlider_changed: {
            HVACModel['leftTemperature']=myDbus.get_value("leftSlider")/100.0
        }
        onTemp_rightSlider_changed: {
            HVACModel['rightTemperature']=myDbus.get_value("rightSlider")/100.0
        }
        onFanSpeed_changed: {
            HVACModel['fanSpeed']=myDbus.get_value("fanSpeed")/100.0
        }
        onAc_changed: {
            HVACModel['fanAC']=myDbus.get_value("AC")
        }
        onTemp_leftSeat_changed: {
            HVACModel['leftSeatHeat']=myDbus.get_value("leftSeat")
        }
        onTemp_rigthSeat_changed: {
            HVACModel['rightSeatHeat']=myDbus.get_value("rightSeat")
        }
        onFanFace_changed: {
            HVACModel['fanRight']=myDbus.get_value("fanFace")
        }
        onFanFeet_changed: {
            HVACModel['fanDown']=myDbus.get_value("fanFeet")
        }
        onFanWindscreen_changed: {
            HVACModel['fanUp']=myDbus.get_value("fanWindscreen")
        }
        onAutoMode_changed: {
            HVACModel['fanAuto']=myDbus.get_value("autoMode")
        }
        onRecycleMode_changed: {
            HVACModel['fanRecirc']=myDbus.get_value("recycleMode")
        }
        onHeatMax_changed: {
            HVACModel['defrostMax']=myDbus.get_value("heatMax")
        }
        onHeatRear_changed: {
            HVACModel['defrostFront']=myDbus.get_value("heatRear")
        }
        onHeatFront_changed: {
            HVACModel['defrostRear']=myDbus.get_value("heatFront")
        }

    }

//    Text{
//        id:t_debug
//        text: "default"
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter
//        color: "white"
//        font.pointSize: 32
//    }

    HazardButton {
        id: hazardButton
        y: 100
        anchors.horizontalCenter: parent.horizontalCenter

    }

    TempSlider {
        id: lTempSlider
        x: 30
        anchors.top: hazardButton.bottom
        anchors.topMargin: 115
        side: "left"
    }

    TempSlider {
        id: rTempSlider
        anchors.top: hazardButton.bottom
        anchors.topMargin: 115
        anchors.right: parent.right
        anchors.rightMargin: 30
        side: "right"
    }

    Row {
        id: m_row
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: hazardButton.bottom
        anchors.topMargin: 90
        spacing: 200

        MiddleColumn {id:leftColumn ; side: "left" }
        MiddleColumn {id:rigthColumn ; side: "right" }
    }



    Image {
        y: 1057
        source: "images/separator.png"
    }

    FanControl {
        x: 259
        y: 1092

    }




    Item {
        id: m_panel
        anchors.horizontalCenter: parent.horizontalCenter
        width: childrenRect.width
        height: childrenRect.height
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        Row {
            id: m_row_panel
            spacing: 20

            Column {
                spacing: 10

                ClimateButton { image: "fan_dir_down"; target: "fanDown" }
                ClimateButton { image: "fan_dir_right"; target: "fanRight" }
                ClimateButton { image: "fan_dir_up"; target: "fanUp" }
            }

            ClimateButton { y: 156; image: "fan_control_ac"; target: "fanAC" }
            ClimateButton { y: 156; image: "fan_control_auto"; target: "fanAuto" }
            ClimateButton { y: 156; image: "fan_control_circ"; target: "fanRecirc" }

            Column {
                spacing: 10

                ClimateButton { image: "defrost_max"; target: "defrostMax" }
                ClimateButton { image: "defrost_rear"; target: "defrostRear" }
                ClimateButton { image: "defrost_front"; target: "defrostFront" }
            }
        }
    }
}

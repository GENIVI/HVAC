/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0
//import Automotive.ClimateControl 1.0

Item {
//    property real fanStepSize:1/255 //Represents the stepSize for a given Climate control.
//    property alias fanSpeed: fanControl.fanSpeedLevel

//    property real temperatureStepSize:1/15 //0== 15c, 15 == 30c

//    property alias leftTemp: leftFront.targetTemperature
//    property alias rightTemp: rightFront.targetTemperature

//    ClimateControlItem {
//        id:fanControl
//    }

//    ClimateControlItem {
//        id: leftFront
//        zone: 9
//    }

//    ClimateControlItem {
//        id: rightFront
//        zone: 5
//    }

    function getRangeValue(inputVal,stepSize){
        if(inputVal > 0){
            return Math.ceil(inputVal/stepSize);
        }else{
            return 0;
        }
    }

}


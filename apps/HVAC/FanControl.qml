/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0
import "models"

Item {
    id: root
    width: fanBar.width +100
    height: fanBar.height + 22

    property real value: HVACModel[propertyName]
    property string propertyName: "fanSpeed"

    function setProperty(v) {
        HVACModel[propertyName] = Math.min(Math.max(v, 0), 1)
    }

    Image {
        y: 15
        source: "images/fan_icon_off.png"
    }

    Image {
        id: fanBar
        x: 100
        source: "images/fan_bar_off.png"
    }

    Image {
        id: fanSlider
        x: 100
        width: value * fanBar.width
        fillMode: Image.PreserveAspectCrop
        horizontalAlignment: Image.AlignLeft
        source: "images/fan_bar_on.png"

        Image {
            width: 20
            height: width
            anchors.verticalCenter: parent.bottom
            anchors.verticalCenterOffset: -1
            anchors.horizontalCenter: parent.right
            source: "images/drag_knob.png"
        }
    }

//    Rectangle {
//        width:  root.value * fanBar.width
//        height: 80
//        color: "#fe9c00"
//        x: 100
//        anchors.verticalCenter: parent.verticalCenter
//    }

//    Rectangle {
//        y: -30
//        x: 100
//        width: root.value * fanBar.width
//        height: 2
//        anchors.bottom: parent.bottom
//        color: "#fe9c00"

//        Image {
//            width: 30
//            height: width
//            anchors.verticalCenter: parent.top
//            anchors.horizontalCenter: parent.right
//            source: "images/drag_knob.png"
//        }
//    }

//    onValueChanged: fanSlider.width = value * fanBar.width

    MouseArea {
        x: 100
        width: fanBar.width
        height: parent.height

        onPressed: setProperty(mouse.x / fanBar.width)
        onPositionChanged: setProperty(mouse.x / fanBar.width)

//        onPositionChanged: {
//            root.value = Math.min(Math.max(mouse.x / fanBar.width, 0), 1)
//            HVACModel[propertyName] = root.value;
//        }
    }
}

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
    width: 64
    height: 716

    property real value: HVACModel[propertyName]
    property string propertyName: side + "Temperature"
    property string side: "left"

    function setProperty(v) {
        HVACModel[propertyName] = Math.min(Math.max(v, 0), 1)
    }

    Rectangle {
        anchors.fill: parent
        color: "#4a53b5ce"
    }
    onValueChanged: {
        console.log("leftTemp = ", HVACModel[propertyName])
    }

    Rectangle {
        width: parent.width
        height: value * parent.height
        color: Style.orangeViv
        anchors.bottom: parent.bottom
    }

    Rectangle {
        x: side === "left" ? parent.width + 30 : -30
        width: 2
        height: value * parent.height
        anchors.bottom: parent.bottom
        color: Style.orangeLt

        Image {
            width: 30
            height: width
            anchors.verticalCenter: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/drag_knob.png"
        }
    }

    MouseArea {
        x: side === "left" ? 0 : -45
        width: parent.width + 45
        height: parent.height

        onPressed: setProperty(1 - mouse.y / height)
        onPositionChanged: setProperty(1 - mouse.y / height)
    }
}


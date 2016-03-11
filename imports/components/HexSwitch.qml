/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width: 170 * height / 80
    height: 80

    property bool value
    property bool showLabels: false

    Image {
        anchors.fill: parent
        source: "../../images/switchplate_" + (value ? "on" : "off") + ".png"
    }

    Item {
        id: shadowTarget
        x: value ? parent.width * 0.375 : -11
        width: parent.width * 0.7
        height: parent.height

        Image {
            id: control
            anchors.centerIn: parent
            width: parent.height * 0.9
            fillMode: Image.PreserveAspectFit
            source: "../../images/switchcontrol.png"
        }
    }

    DropShadow {
        anchors.fill: shadowTarget
        cached: true
        horizontalOffset: parent.height * 0.05
        verticalOffset: parent.height * 0.05
        radius: 16
        samples: 32
        color: Qt.rgba(0, 0, 0, 0.35)
        smooth: true
        source: shadowTarget
    }

    Text {
        text: qsTr("OFF")
        font.family: "Source Sans Pro"
        anchors.right: parent.left
        anchors.rightMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 25
        font.letterSpacing: -0.5
        font.weight: value ? Font.Normal : Font.Bold
        color: value ? "#C4C4C4" : "#FE9C00"
        visible: showLabels
    }

    Text {
        id: onText
        text: qsTr("ON")
        font.family: "Source Sans Pro"
        anchors.left: parent.right
        anchors.leftMargin: 30
        font.pointSize: 25
        anchors.verticalCenter: parent.verticalCenter
        font.letterSpacing: -0.5
        font.weight: value ? Font.Bold : Font.Normal
        color: value ? "#59FF00" : "#C4C4C4"
        visible: showLabels
    }

    MouseArea {
        anchors.fill: parent
        onClicked: value = !value
    }
}

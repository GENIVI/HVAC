/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Item {
    id: root
    width: 120
    height: 120
    property string text
    signal clicked()
    property alias pressed: area.pressed
    property alias color: background.color
    property alias fontSize: label.font.pixelSize
    property bool fill: false

    Rectangle {
        id: background
        anchors.fill: parent
        color: Style.backgroundColor
        opacity: root.fill ? 1.0: 0.2
    }

    Rectangle {
        id: frame
        anchors.fill: parent
        color: 'transparent'
        border.color: Qt.darker(background.color, 1.4)
        border.width: 2
        opacity: 1.0
    }


    Rectangle {
        anchors.fill: label
        anchors.margins: -2
        color: Style.backgroundColor
        opacity: root.text ? 1.0 : 0.0
    }

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: 14
        color: Style.greyDarkColor
        opacity: 0.75
        text: root.text
    }
    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: root.clicked()
        onPressed: background.color = Qt.darker(background.color, 1.5)
        onReleased:  background.color = Qt.lighter(background.color, 1.5)
    }
}

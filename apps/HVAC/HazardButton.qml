/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Rectangle {
    id: hazardButton
    width: 624
    height: 122
    color: "#aa000000"
    border.color: "#ff53b5ce"

    property bool value: false
    property bool flash: false

    Image {
        id: image
        source: "./images/hazard_" + (value ? (flash ? "blink" : "on") : "off") + ".png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: value = !value
    }

    Timer {
        id: timer
        interval: 500
        repeat: true
        running: value

        onTriggered: flash = !flash
    }
}

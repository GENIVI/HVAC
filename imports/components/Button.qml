/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Rectangle {
    id: root
    border.color: "#cccccc"
    color:"#222"
    border.width: 2
    height: pairText.height + 20
    width: pairText.width + 20

    property string buttonText


    Text {
        id: pairText
        anchors.centerIn: parent
        font.family: "Source Sans Pro"
        font.pixelSize: 48
        font.weight: Font.Bold
        color: "white"
        font.capitalization: Font.AllUppercase
        text: buttonText
    }
}

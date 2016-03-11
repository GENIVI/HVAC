/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import "models"

Rectangle {
    id: root

    width: imageItem.width
    height: imageItem.height
    color: "#aa000000"

    property string target: ""
    property string image: ""
    property bool value: HVACModel[target]

    Image {
        id: imageItem
        source: "images/" + image + "_" + (value ? "on" : "off") + ".png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: HVACModel[target] = !HVACModel[target]
    } 
}

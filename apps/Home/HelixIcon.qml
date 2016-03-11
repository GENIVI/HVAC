/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Item {
    id: root

    transform: Scale { xScale: xscale }
    smooth: true
    transformOrigin: Item.TopLeft

    property real xscale: 1
    property string name

    signal clicked()

    Image {
        id: background
        x: -0.5 * width
        y: -0.5 * height
        source: "images/HomeHex.png"
    }

    Image {
        id: icon
        anchors.centerIn: background
        anchors.horizontalCenterOffset: 2.5
        anchors.verticalCenterOffset: 2.5
        visible: xscale > 0
        sourceSize.width: 300
        sourceSize.height: 300
        scale: 0.5
        source: "../../images/" + name + "_app_icon.svg"
    }

    MouseArea {
        anchors.fill: background
        onClicked: root.clicked()
    }
}

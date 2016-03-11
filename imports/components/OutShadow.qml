/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0    
import QtGraphicalEffects 1.0

Item {
    id: root

    anchors.fill: parent
    property alias color: shadow.color
    property alias radius: shadow.radius

    Item {
        id: shadowTarget
        x: -radius
        y: -radius
        width: parent.width + 2 * radius
        height: parent.height + 2 * radius

        Rectangle {
            anchors.centerIn: parent
            width: root.width
            height: root.height
            color: "black"
        }
    }

    DropShadow {
        id: shadow
        anchors.fill: shadowTarget
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        samples: 32
        source: shadowTarget
    }
}

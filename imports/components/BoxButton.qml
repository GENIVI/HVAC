/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0

Item {
    id: root

    property alias shadow: box.shadow
    property alias color: box.color
    property alias text: textItem.text

    signal clicked()

    Box {
        id: box
        anchors.fill: parent

        Text {
            id: textItem
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}

/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    id: root

    width: 90
    height: 90

    property string name

    signal clicked()

    Image {
        id: icon
        anchors.centerIn: parent
        source: "images/" + name + "_app_icon.png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}

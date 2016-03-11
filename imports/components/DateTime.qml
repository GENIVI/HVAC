/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Item {
    id: dateTime
    anchors.left: parent.left
    anchors.right: parent.right
    height: 120
    property var timeStamp: new Date()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeStamp = new Date()
    }

    Label {
        fontColor: Style.grey
        text: Qt.formatDate(timeStamp, "ddd MMM d")
    }

    Label {
        anchors.right: parent.right
        fontColor: Style.grey
        text: Qt.formatTime(timeStamp, "h:mm AP")
    }
}


/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import "models"

Rectangle {
    width: 237
    height: 350
    color: "#aa000000"

    property string side: "left"
    property string propertyName: side + "Temperature"
    property real value: HVACModel[propertyName]

    ListView {
        anchors.fill: parent
        clip: true
        snapMode: ListView.SnapToItem
        model: TemperatureModel
        header: Item { height: 120 }
        footer: Item { height: 120 }
        currentIndex: Math.min(value * count, count - 1)
        flickDeceleration: 5000
        onContentYChanged: {
            if (dragging || flicking) {
                var item = Math.round((contentY + 120) / 110)
                item = Math.max(Math.min(item, count - 1), 0)
                if (item != currentIndex) {
                    var temperature = item / (count - 1)
                    HVACModel[propertyName] = temperature
                }
            }
        }
        highlightMoveDuration: 100
        interactive: true

        delegate: Text {
            x: side === "right" ? 40 : 10
            height: 110
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pixelSize: 70
            text: model.text
        }
    }

//    Image {
//        mirror: side === "left"
//        source: "./images/right_number_cover.svg"
//        anchors.fill: parent
//    }
}

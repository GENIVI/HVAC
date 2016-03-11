/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Item {
    // Tracer {}
    width: childrenRect.width
    height: childrenRect.height
    property alias text: text.text
    property alias label: text
    property alias fontSize: text.font.pixelSize
    property alias fontColor: text.color

    Text {
        id: text
        color: "#ddd"
        font.family: "Source Sans Pro"
        font.pixelSize: 40
        font.capitalization: Font.AllUppercase
        font.weight: Font.Bold
     }
}

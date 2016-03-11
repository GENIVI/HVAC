/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import components 1.0
import utils 1.0

Item {
    height: icon.height
    width: icon.height

    property alias iconSize: icon.font.pixelSize
    property alias ucKey: icon.text
    property alias iconColor: icon.color

    Text {
        id: icon
        font.family: "FontAwesome"
        color: "white"
    }
}


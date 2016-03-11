/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import utils 1.0

Item {
    id: root

    width: 239
    height: 800

    property string side: "left"

    Column {
        spacing: 50

        BoxHeading {
            color: Style.orangeViv
            boxWidth: 45
            boxHeight: 19
            fontSize: 27
            text: (side === "left" ? "L" : "R" ) + " CLIMATE"
        }

        SeatHeatButton { side: root.side }
        TemperatureWheel { side: root.side }
    }
}

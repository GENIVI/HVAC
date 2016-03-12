/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import "models"
//import com.jlr.dbus 1.0
import Dbushelper 1.0

Rectangle {
    width: 239
    height: 194
    color: "#aa000000"
    border.color: "#ff53b5ce"

    property string side: "left"
    property string propertyName: side + "SeatHeat"
    property int seatHeat: HVACModel[propertyName]

    Image {
        source: "./images/" + side + "_heat_seat_off.png"
    }

    Image {
        id: img_fill
        y: 150 - seatHeat*40
        height: implicitHeight - y
        fillMode: Image.Tile
        verticalAlignment: Image.AlignBottom
        source: "./images/" + side + "_heat_seat_on.png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var value = HVACModel[propertyName]
            HVACModel[propertyName] = value > 0 ? value - 1 : 3
//            myDBus.set_temp(value)
//            myDBus.debug_print(propertyName)
//            DBus.emitSignal(side + " seat =" + value)
        }

    }

    onSeatHeatChanged: img_fill.y=150-seatHeat*40

//    Dbushelper {
//        id:myDBus
//        onTemp_changed: {

//            t_debug.text= myDBus.get_temp()
//            seatHeat=myDBus.get_temp()

//        }

//    }

}

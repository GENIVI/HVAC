/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0
import vehicle 1.0

App {
    id: root
    appId: "home"

    Helix {
        anchors.fill: parent
        onShowApp: System.activeApp = app
    }

    Column {
        y: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors { leftMargin: 40; rightMargin: 40 }
        spacing: 13

        DateTime {}

        Item {
            width: parent.width
            height: childrenRect.height

            Column {
                y: 5
                spacing: -8

                Text {
                    color: "white"
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 22
                    text: "Fuel"
                }

                Text {
                    color: "white"
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 45
                    text: FuelModel.percentage.toFixed(0) + "%"
                }
            }

            Column {
                anchors.right: parent.right
                spacing: -6

                Text {
                    anchors.right: parent.right
                    color: "white"
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 45
                    text: TemperatureModel.outdoorString
                }

                Text {
                    anchors.right: parent.right
                    color: "white"
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 22
                    text: "Portland OR"
                }
            }
        }

        Item {
            width: parent.width
            height: childrenRect.height

            Row {
                y: -5
                spacing: 10

                Text {
                    id: speed
                    color: Style.blueViv
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 75
                    text: SpeedModel.textSpeed.toFixed(0)
                }

                Text {
                    anchors.baseline: speed.baseline
                    color: Style.blueViv
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 22
                    text: SpeedModel.metric ? "KM/H" : "MPH"
                }
            }

            Column {
                anchors.right: parent.right
                spacing: -7

                Text {
                    anchors.right: parent.right
                    color: Style.blueViv
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 22
                    text: "Int. Temp"
                }

                Text {
                    anchors.right: parent.right
                    color: Style.blueViv
                    font.family: "Source Sans Pro"
                    font.weight: Font.Bold
                    font.pixelSize: 45
                    text: TemperatureModel.indoorString
                }
            }
        }
    }
}

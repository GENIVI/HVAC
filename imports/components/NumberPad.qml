/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Item {
    id: root
    height: childrenRect.height
    property var letters: ["","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"]
    property var bottomRow: ["*","0","#"]

    signal number(string number)

    Grid {
        id: numberGrid
        columns: 3
        spacing: 20

        Repeater {
            model: 9
            delegate: Item {
                id: numberKey
                width: (root.width - ( numberGrid.spacing*(numberGrid.columns-1)))/numberGrid.columns
                height: numberKey.width * 0.8
                anchors.margins: 10

                Rectangle {
                    id: shadowTarget
                    anchors.fill: parent
                    border.width: 1
                    border.color: "white"
                    color: "#6653b5ce"
                }

                Item {
                    height: childrenRect.height
                    width: parent.width
                    anchors.centerIn: parent

                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: keypadNumber
                        text: index + 1
                    }

                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: keypadLetters
                        anchors.top: keypadNumber.bottom
                        fontSize: 30
                        fontColor: "#53b5ce"
                        text: letters[index]
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.number(keypadNumber.text)
                }
            }
        }

        Repeater {
            model: 3
            delegate: Item {
                width: (root.width - ( numberGrid.spacing*(numberGrid.columns-1)))/numberGrid.columns
                height: width * 0.8
                anchors.margins: 10

                Rectangle {
                    id: shadowTarget
                    anchors.fill: parent
                    border.width: 1
                    border.color: "white"
                    color: "#6653b5ce"
                }

                Item {
                    height: childrenRect.height
                    width: parent.width
                    anchors.centerIn: parent

                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: keypadNumber
                        text: bottomRow[index]
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.number(keypadNumber.text)
                }
            }
        }
    }
}

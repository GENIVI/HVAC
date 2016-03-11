/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    id: root

    property real angle: -1
    property bool animate: true

    signal showApp(string app)

    onVisibleChanged: animate = visible

    SequentialAnimation on angle {
        running: animate
        loops: Animation.Infinite
        NumberAnimation { id: rotateAnimate; from: 0; to: 360; duration: 6000 }
    }

    MouseArea {
        anchors.fill: parent

        property real lastX: 0
        property real diff: 0
        property bool track: true

        onPositionChanged: {
            if (track) {
                diff = mouse.x - lastX
                angle += diff * 180 / width
                while (angle < 0) angle += 360
                angle %= 360
            }

            lastX = mouse.x
            animate = false
            track = true
        }

        onReleased: {
            if (Math.abs(diff) > 10) {
                rotateAnimate.from = angle
                if (diff > 0)
                    rotateAnimate.to = angle + 360
                else
                    rotateAnimate.to = angle - 360
                animate = true
            }
            track = false
        }
    }

    ListModel {
        id: appsModel
        ListElement { icon: "hvac" }
        ListElement { icon: "googlemaps" }
        ListElement { icon: "browser" }
        ListElement { icon: "cameras" }
        ListElement { icon: "dashboard" }
        ListElement { icon: "nfc" }
        ListElement { icon: "media_player" }
        ListElement { icon: "fmradio" }
        ListElement { icon: "weather" }
        ListElement { icon: "phone" }
        ListElement { icon: "news" }
        ListElement { icon: "hvac" }
        ListElement { icon: "media_player" }
        ListElement { icon: "browser" }
    }

    Item {
        id: icons
        y: 35

        // Icons
        Repeater {
            model: appsModel
            delegate: HelixIcon {
                name: model.icon
                onClicked: root.showApp(model.icon)
            }
        }

        // Horizontal strands, need to be siblings to icons for z-ordering
        Repeater {
            model: appsModel.count / 2 + 2
            delegate: Item {
                y: 35 + height * (model.index - 1)
                height: 1.9 * root.height / appsModel.count

                Rectangle {
                    id: rect
                    height: 5
                    width: parent.width
                    anchors.centerIn: parent
                    color: "purple"
                    opacity: 0.5
                }
            }
        }

        // Vertical strands, need to be siblings to icons for z-ordering
        Repeater {
            model: appsModel.count + 6
            delegate: Item {
                transformOrigin: Item.TopLeft

                Rectangle {
                    id: rect
                    x: -8
                    height: parent.height
                    width: 16
                    color: "purple"
                    opacity: 0.5
                }
            }
        }
    }

    Column {
        id: rects
        y: 80
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            model: 7
            delegate: Item {
                width: 2 * root.width * 0.29
                height: 1.85 * root.height / appsModel.count

                Rectangle {
                    id: rect
                    height: 10
                    anchors.centerIn: parent
                    color: "purple"
                    opacity: 0.7
                }
            }
        }
    }

    onAngleChanged: {
        var items = icons.children
        var spacing = 1.9 * height / appsModel.count
        var size = width * 0.3
        var rows = appsModel.count / 2
        var toDeg = 180 / 3.14159265
        var toRad = 3.14159265 / 180

        var helix = []
        for (var n = -2; n < rows + 2; n++) {
            var ang = (angle - n * 33) * toRad
            helix[n] = {cos: Math.cos(ang), sin: Math.sin(ang)}
        }

        // Icons
        for (var row = 0; row < rows; row++) {
            var h = helix[row]

            var icon = items[row * 2]
            var scale = 1.1 + 0.4 * h.cos
            var xdiff = size * h.sin
            icon.x = 0.5 * width + xdiff
            icon.y = (row + 0.65) * spacing + 40 * h.cos
            icon.scale = 0.5 * scale
            icon.z = h.cos > 0 ? 1 : -1
            icon.xscale = h.cos

            icon = items[row * 2 + 1]
            scale = 1.1 - 0.4 * h.cos
            icon.x = 0.5 * width - xdiff
            icon.y = (row + 0.65) * spacing - 40 * h.cos
            icon.scale = 0.5 * scale
            icon.z = h.cos < 0 ? 1 : -1
            icon.xscale = -h.cos
        }

        // Horizontal strands
        for (var row = 0; row < rows + 2; row++) {
            var h = helix[row - 1]

            var strand = items[2 * rows + row + 1]
            var xval = size * h.sin
            var yval = 40 * h.cos
            var w = 2 * Math.sqrt(xval*xval + yval*yval)
            strand.x = 0.5*(root.width - w)
            strand.width = w
            strand.rotation = Math.atan2(yval, xval) * toDeg
        }

        // Vertical strands
        for (var row = 0; row < rows + 3; row++) {
            var h = helix[row - 2]
            var h2 = helix[row - 1]

            var strand = items[3 * rows + 2 * row + 4]
            var xval = size * h.sin * 0.99
            var xdiff = xval - size * h2.sin * 0.99
            var ydiff = 40 * (h2.cos - h.cos) + spacing
            var atan = Math.atan2(xdiff, ydiff)
            var w = Math.sqrt(xdiff*xdiff + ydiff*ydiff)
            strand.x = 1080 * 0.5 + xval
            strand.y = (row - 1.35) * spacing + 40 * h.cos
            strand.rotation = atan * toDeg
            strand.height = w + 3

            strand = items[3 * rows + 2 * row + 5]
            ydiff = 40 * (h.cos - h2.cos) + spacing
            atan = Math.atan2(xdiff, ydiff)
            w = Math.sqrt(xdiff*xdiff + ydiff*ydiff)
            strand.x = 1080 * 0.5 - xval
            strand.y = (row - 1.35) * spacing - 40 * h.cos
            strand.rotation = -atan * toDeg
            strand.height = w + 3
        }
    }
}

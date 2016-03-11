/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
//import execScript 1.0

Item {
    id: root

    height: 120

    ShaderEffect {
        anchors.fill: parent
        property color color: "#777"
        property real radius: 40
        opacity: 0.24

        fragmentShader: "
uniform lowp float radius;
uniform lowp float height;
uniform lowp float width;
uniform lowp float qt_Opacity;
uniform lowp vec4 color;
varying highp vec2 qt_TexCoord0;

void main(void) {
    lowp vec2 dist = min(qt_TexCoord0, vec2(1.0) - qt_TexCoord0);
    lowp float xval = smoothstep(0.0, radius, dist.x * width);
    lowp float yval = smoothstep(0.0, radius, dist.y * height);
    gl_FragColor = mix(color, vec4(1.0), sqrt(yval * xval)) * qt_Opacity;
}
        "
    }

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 5
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30

        Image {
            property var mainScreen: root.parent
            property bool home: System.activeApp === "home"
            source: home ? "images/tizen.png" : "images/homescreen_icon.png"

            MouseArea {
                anchors.fill: parent
		property string file : "./switch_off_navi.sh"
                onClicked: {
			System.activeApp = "home"
			execscript.execute(file)
		}
            }
        }

        Image {
            source: "images/googlemaps_app_icon.png"

            MouseArea {
                anchors.fill: parent
		property string file : "./switch_on_navi.sh"

                onClicked: {
			System.activeApp = "googlemaps"
			execscript.execute(file)
		}
            }

            Rectangle {
                x: -15.5
                y: -15
                height: 123
                width: 1
                color: "black"
            }
        }

        Repeater {
            model: ListModel {
                ListElement { name: "browser" }
                ListElement { name: "dashboard" }
                ListElement { name: "hvac" }
                ListElement { name: "weather" }
                ListElement { name: "fmradio" }
                ListElement { name: "nfc" }
            }

            delegate: AppIcon {
                name: model.name
                onClicked: System.activeApp = name

                Rectangle {
                    x: -15.5
                    y: -15
                    height: 123
                    width: 1
                    color: "black"
                }
            }
        }

        Image {
            source: "images/application_grid.png"

            MouseArea {
                anchors.fill: parent
                onClicked: System.activeApp = "appgrid"
            }

            Rectangle {
                x: -15.5
                y: -15
                height: 123
                width: 1
                color: "black"
            }
        }

    }

//    ExecScript { id:execscript }
}

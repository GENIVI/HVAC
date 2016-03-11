/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.3
import "apps/Home"
import "apps/HVAC"

import system 1.0

Item {
    width: 1080
    height: 1920

    Image {
        anchors.centerIn: parent
        source: "images/Hex-Background.jpg"
    }

    Item {
        id: appSurface

        anchors.top: topbar.bottom
        anchors.bottom: bottombar.top
        anchors.left: parent.left
        anchors.right: parent.right

        //        AppGrid {
        //            anchors.centerIn: parent
        //            visible: System.activeApp === "hvac"
        //        }


        //        Home {}
        HVAC {
            anchors.centerIn: parent
            visible: System.activeApp === "hvac"
        }

    }

    TopBar {
        id: topbar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    BottomBar {
        id: bottombar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }


}

/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0

Item {
    property bool metric: true

    function unit(value) {
        return celsiusToFahrenheit(value).toFixed(1) + "\u00b0" + (metric ? "C" : "F")
    }

    function celsiusToFahrenheit(value) {
        return (metric ? value : 1.8 * value + 32)
    }

    property real indoor: 20.4
    property string indoorString: unit(indoor)
    property real outdoor: 28.9
    property string outdoorString: unit(outdoor)
}

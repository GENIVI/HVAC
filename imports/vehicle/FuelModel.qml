/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0

Item {
    property bool metric: false

    function galToL(value) {
        return (metric ? 3.78541 : 1) * value
    }

    function mpgToLp100(value) {
        return metric ? 235.214583571 / value : value
    }

    property real baseTank: 25
    property real tankSize: galToL(baseTank)
    property real level: tankSize * percentage * 0.01
    property real percentage: 100
    property real range: metric ? 100 * level / average : level * average
    property real baseAverage: 20.7
    property real average: mpgToLp100(baseAverage + mpgDiff)
    property real mpgDiff: 0

    NumberAnimation on percentage {
        from: 100
        to: 0
        duration: 5000
        loops: Animation.Infinite
        easing.type: Easing.CosineCurve
    }

    NumberAnimation on mpgDiff {
        from: -2
        to: 2
        duration: 11200
        loops: Animation.Infinite
        easing.type: Easing.CosineCurve
    }
}

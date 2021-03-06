/****************************************************************************
**
** Copyright (C) 2017 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0

import utils 1.0

UIElement {
    id: root
    vspan: 2

    property alias text: label.text
    property string iconName
    property alias label: label
    property alias icon: icon
    property alias pressed: mouseArea.pressed

    property int spacing: Style.padding

    signal pressed

    Rectangle {
        anchors.fill: parent
        color: '#000'
        opacity: 0.85

        Behavior on scale { NumberAnimation {} }
    }

    Column {
        id: layout

        anchors.centerIn: parent

        spacing: root.spacing

        Image {
            id: icon

            source: iconName ? Style.symbol(iconName) : ""
            anchors.horizontalCenter: parent.horizontalCenter
            visible: source !== undefined
            asynchronous: true
        }

        Label {
            id: label
            visible: text
            opacity: root.enabled ? 1.0 : 0.6
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Style.fontSizeM
            scale: mouseArea.pressed?0.85:1.0
            Behavior on scale { NumberAnimation {} }
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onClicked: root.pressed()
    }
}

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
import QtQuick.Window 2.1
import QtApplicationManager 1.0
import com.pelagicore.ScreenManager 1.0
import utils 1.0
import "Cluster/qml"
import "CenterConsole"
import "PassengerView"

Main {
    id: root

    Window {
        id: cluster
        title: "Cluster Display"
        height: 720
        width: 1920
        visible: false

        color: "black"

        DashboardFrame {}

        Component.onCompleted: {
            WindowManager.registerCompositorView(cluster)
            Style.withCluster = true
            ScreenManager.setScreen(cluster, 1)
            cluster.show()
        }
    }
    Window {
        id: passengerView
        title: "Passenger Display"
        width: Style.screenHeight
        height: Style.screenWidth
        visible: false

        color: "black"

        PassengerView {}

        Component.onCompleted: {
            WindowManager.registerCompositorView(passengerView)
            Style.withPassengerView = true
            ScreenManager.setScreen(passengerView, 2)
            passengerView.show()
        }
    }


    Window.onActiveChanged: {
         if (Window.active && !WindowManager.runningOnDesktop)
             cluster.requestActivate()
    }
}

// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import org.deepin.dtk 1.0 as D
import org.deepin.dtk.style 1.0 as DS
import org.deepin.dtk.private 1.0 as P

FocusScope {
    id: control
    property int maxVisibleItems : DS.Style.arrowListView.maxVisibleItems
    property int itemHeight:  DS.Style.arrowListView.itemHeight
    property alias view: itemsView

    implicitWidth: Math.max(DS.Style.arrowListView.width, contentLayout.implicitWidth)
    implicitHeight: contentLayout.implicitHeight

    ColumnLayout {
        id: contentLayout
        anchors.fill: parent
        P.ArrowListViewButton {
            visible: itemsView.interactive
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: width
            Layout.preferredHeight: height
            view: itemsView
            direction: P.ArrowListViewButton.UpButton
        }

        ListView {
            id: itemsView
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitHeight: Math.min(contentHeight, maxVisibleItems * itemHeight)
            implicitWidth:{
                var maxWidth = DS.Style.arrowListView.width
                for (var i = 0; i < itemsView.count; ++i) {
                    var item = itemsView.itemAtIndex(i)
                    if (item && item.implicitWidth > maxWidth)
                        maxWidth = item.implicitWidth
                }
                return maxWidth
            }
            interactive: Window.window ? (contentHeight > Window.window.height || model.count > maxVisibleItems) : false
            ScrollIndicator.vertical: ScrollIndicator { }
            highlight: HighlightPanel {
                visible: false // TODO listview's highlight is confict with Item's highlight.
                outerShadowColor: null
                innerShadowColor: null
                scale: D.DTK.hasAnimation ? 0.9 : 1.0
                Component.onCompleted: {
                    scale = 1.0
                }
                Behavior on scale {
                    NumberAnimation { duration: 100 }
                }
            }
            highlightFollowsCurrentItem: true
            highlightMoveDuration: -1
            highlightMoveVelocity: 400
        }

        P.ArrowListViewButton {
            visible: itemsView.interactive
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: width
            Layout.preferredHeight: height
            view: itemsView
            direction: P.ArrowListViewButton.DownButton
        }
    }
}

// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects
import org.deepin.dtk 1.0 as D
import org.deepin.dtk.style 1.0 as DS

Popup {
    id: control

    property alias roundedRadius: path.roundedRadius
    property alias arrowWidth: path.arrowWidth
    property alias arrowHeight: path.arrowHeight
    property alias arrowDirection: path.arrowDirection

    property real arrowX: 0
    property real arrowY: 0

    implicitWidth: DS.Style.control.implicitWidth(control)
    implicitHeight: DS.Style.control.implicitHeight(control)
    leftPadding: arrowDirection === D.DTK.LeftArrow ? arrowHeight : 0
    topPadding: arrowDirection === D.DTK.UpArrow ? arrowHeight : 0
    rightPadding: arrowDirection === D.DTK.RightArrow ? arrowHeight : 0
    bottomPadding: arrowDirection === D.DTK.DownArrow ? arrowHeight : 0

    D.ArrowBoxPath {
        id: path
        width: control.width
        height: control.height
        roundedRadius: DS.Style.arrowRectangleBlur.roundJoinRadius
    }

    background: Item {
        implicitWidth: maskPath.implicitWidth
        implicitHeight: maskPath.implicitHeight

        D.ArrowBoxPath {
            id: outsideBorderPath
            arrowX: path.arrowX
            arrowY: path.arrowY
            arrowWidth: path.arrowWidth
            arrowHeight: path.arrowHeight
            arrowDirection: path.arrowDirection
            width: path.width
            height: path.height
            roundedRadius: path.roundedRadius
            spread: DS.Style.arrowRectangleBlur.borderWidth / 2
        }
        D.ArrowBoxPath {
            id: insideBorderPath
            arrowX: path.arrowX
            arrowY: path.arrowY
            arrowWidth: path.arrowWidth
            arrowHeight: path.arrowHeight
            arrowDirection: path.arrowDirection
            width: path.width
            height: path.height
            roundedRadius: path.roundedRadius
            spread: -DS.Style.arrowRectangleBlur.borderWidth / 2
        }

        D.InWindowBlur {
            id: blur
            anchors.fill: parent
            offscreen: true
        }

        DropShadow {
            id: __shadow
            anchors.fill: parent
            verticalOffset: 6
            radius: 12
            source: mask
            color: DS.Style.selectColor(palette.window, DS.Style.arrowRectangleBlur.shadowColor,
                                        DS.Style.arrowRectangleBlur.darkShadowColor)
        }

        Shape {
            id: maskPath
            anchors.fill: parent
            visible: false
            layer {
                enabled: true
                samples: 8
            }

            ShapePath {
                fillColor: "red"
                strokeColor: "transparent"
                pathElements: path
            }
        }

        D.OpacityMask {
            id: mask
            anchors.fill: parent
            maskSource: maskPath
            source: blur
        }

        Item {
            layer {
                enabled: true
                samples: 8
            }

            anchors {
                fill: parent
                margins: -DS.Style.arrowRectangleBlur.borderWidth
            }

            Shape {
                anchors.centerIn: parent
                width: maskPath.width
                height: maskPath.height
                ShapePath {
                    fillColor: {
                        if (blur.valid)
                            return DS.Style.selectColor(palette.window, DS.Style.arrowRectangleBlur.backgroundColor,
                                                        DS.Style.arrowRectangleBlur.darkBackgroundColor)
                        return DS.Style.selectColor(palette.window, DS.Style.arrowRectangleBlur.backgroundNoBlurColor,
                                                    DS.Style.arrowRectangleBlur.darkBackgroundNoBlurColor)
                    }

                    strokeColor: DS.Style.selectColor(palette.window, DS.Style.arrowRectangleBlur.outBorderColor,
                                                      DS.Style.arrowRectangleBlur.darkOutBorderColor)
                    strokeWidth: DS.Style.arrowRectangleBlur.borderWidth
                    pathElements: outsideBorderPath
                }

                ShapePath {
                    fillColor: "transparent"
                    strokeColor: DS.Style.selectColor(palette.window, DS.Style.arrowRectangleBlur.inBorderColor,
                                                      DS.Style.arrowRectangleBlur.darkInBorderColor)
                    strokeWidth: DS.Style.arrowRectangleBlur.borderWidth
                    pathElements: insideBorderPath
                }
            }
        }
    }
}

// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.deepin.dtk 1.0

ColumnLayout {
    property url url

    onUrlChanged: {
        edit.text = globalObject.readFile(url)
    }

    Text {
        id: errorMessage
        visible: text
        color: "#ff5736"
        font: DTK.fontManager.t6
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Qt.AlignCenter
        Layout.fillWidth: true
    }

    Row {
        id: layout
        property url url

//        Layout.preferredWidth: parent.width
//        Layout.fillWidth: true
//        Layout.fillHeight: true
        Layout.preferredHeight: parent.height
        Layout.fillWidth: true
        Layout.fillHeight: true

        ScrollView {
            id: codePreview
//            Layout.fillHeight:  true
//            Layout.preferredWidth: layout.implicitWidth * 0.6
//            Layout.preferredWidth: parent.width * 0.6
//            Layout.preferredWidth: guest.width * 0.6
            width: layout.parent.width * 0.6
            height: parent.height
            clip: true
            Item {id: guest;}
        }

        ScrollView {
//            Layout.fillWidth: true
//            Layout.fillHeight: true
            width: layout.parent.width * 0.4
            height: parent.height
            TextArea {
                id: edit

                property Item lastPreview: guest

                width: parent.width
                selectByMouse: true
                selectByKeyboard: true

                onTextChanged: {
                    try {
                        var obj = Qt.createQmlObject(edit.text, codePreview,  url.toString().replace(".qml", "_temporary.qml"))
                        globalObject.replace(lastPreview, obj)
                        lastPreview = obj
                        obj.width = codePreview.width
                        errorMessage.text = ""
                    } catch (error) {
                        errorMessage.text = String(error.lineNumber ? error.lineNumber : "未知") + "行，"
                                + String(error.columnNumber ? error.columnNumber : "未知") + "列：" + error.message
                    }
                }
            }
        }
    }
}

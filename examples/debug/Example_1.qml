import QtQuick 2.0
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11
import QtQml.Models 2.11
import org.deepin.dtk 1.0 as D

D.DialogWindow {
    id: settingMainWindow;// objectName: "windowbtn"
    visible: true
    width: 470
    height: 242
    minimumHeight: height
    minimumWidth: width
    maximumHeight: height
    maximumWidth: width
    D.DWindow.enabled: true
    modality: Qt.ApplicationModal
    icon: "uos-activator_tiny"

    property var customAddresss: []

    function setRadioBtnSelect(isDefault) {
        useDefault.checked = isDefault
        useCustomized.checked = !isDefault
    }

    Item {
        id: rootItem

        focus: true
        Keys.enabled: true
        Keys.onPressed: {
            if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return
                    && confirm.enabled) {

                if (cancel.focus) {
                    cancel.clicked()
                } else {
                    confirm.clicked()
                }
            }
        }

        ColumnLayout {
            Layout.topMargin: 0
            D.Label {
                id: title
                text: qsTr("Set Up Authorization Server")
                Layout.alignment: Qt.AlignCenter
                font.pointSize: D.DTK.fontManager.t6.pointSize
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 38
            }

            RowLayout {
                spacing: 0
                ColumnLayout {
                    Layout.leftMargin: 0
                    Layout.rightMargin: 0
                    spacing: 10
                    D.RadioButton {
                        id: useDefault
                        text: qsTr("Default")
                        leftPadding: 0
                        checked: true
                        Layout.preferredWidth: 102
                        Layout.preferredHeight: 36

                        font: D.DTK.fontManager.t6
                        onClicked: {
                            setRadioBtnSelect(true)
                            confirm.enabled = true
                        }
                    }

                    D.RadioButton {
                        id: useCustomized
                        leftPadding: 0
                        text: qsTr("Customize")
                        Layout.preferredWidth: 102
                        Layout.preferredHeight: 36
                        font: D.DTK.fontManager.t6
                        onClicked: {
                            setRadioBtnSelect(false)
                        }
                    }
                }

                ColumnLayout {
                    spacing: 10
                    D.Button {
                        id: defaultUrls
                        text: "proto cac"
                        font: D.DTK.fontManager.t6
                        Layout.preferredWidth: 348
                        Layout.preferredHeight: 36
                        onClicked: {
                            setRadioBtnSelect(true)
                            cancel.enabled = !cancel.enabled
                        }
                    }

                    RowLayout {
                        spacing: 10
                        D.Button {
                            id: protocols
                            text: "proto crf"
                            font: D.DTK.fontManager.t6
                            Layout.preferredWidth: 104
                            Layout.preferredHeight: 36
                            onClicked: {
//                                customUrl.text = customAddresss[protocols.currentIndex]
                                setRadioBtnSelect(false)
                                confirm.enabled = !confirm.enabled
                            }
                        }
                        D.LineEdit {
                            property int maxAllowLength: 2048
                            property bool isMax: false
                            id: customUrl
                            font: D.DTK.fontManager.t6
                            Layout.preferredWidth: 234
                            Layout.preferredHeight: 36
                            maximumLength: maxAllowLength + 1
                            alertText: qsTr("It should be no more than %1 characters").arg(
                                           maxAllowLength)
                            showAlert: false
                            alertDuration: 1000
                            placeholderText: ""

                            onTextChanged: {
                                if (customUrl.text.length > maxAllowLength) {
                                    customUrl.showAlert = true
                                    customUrl.text = customUrl.text.substr(
                                                0, maxAllowLength)
                                }
                                setRadioBtnSelect(false)
                            }
                        }
                    }
                }
            }
            Item {
                Layout.preferredHeight: 13
            }

            RowLayout {
                Layout.leftMargin: 0
                spacing: 10
                D.Button {
                    id: cancel
                    text: qsTr("Cancel")
                    font: D.DTK.fontManager.t6
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 36
                    onClicked: {
                        Window.window.close()
                    }
                }
                D.RecommandButton {
                    id: confirm; objectName: "windowbtn"
                    text: qsTr("Confirm")
//                    font: D.DTK.fontManager.t6
//                    D.ColorSelector.family: D.Palette.CommonColor
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 36
                    Layout.alignment: Qt.AlignRight
                    onClicked: {
                        Window.window.close()
                    }
                }
                Rectangle {
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 36
                    color: confirm.palette.windowText
                }
                Rectangle {
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 36
                    color: cancel.palette.windowText
                }
            }
        }
    }
}

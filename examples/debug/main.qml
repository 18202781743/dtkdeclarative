// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import org.deepin.dtk 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1200
    height: 700
    title: qsTr("dtkdeclarative")
    x:(Screen.desktopAvailableWidth - width) / 2
    y:(Screen.desktopAvailableHeight - height) / 2
//    DWindow.wmWindowTypes: WindowManagerHelper.DesktopType
//    header: Example_TitleBar{}
    flags: Qt.Window | Qt.WindowMinMaxButtonsHint | Qt.WindowCloseButtonHint | Qt.WindowTitleHint
//    DWindow.motifFunctions: DWindow.motifFunctions & ~WindowManagerHelper.FUNC_MINIMIZE

    // 测试DWindow的属性
    DWindow.enabled: true
    DWindow.windowRadius: 16
    DWindow.borderColor: palette.highlight
    DWindow.borderWidth: 1
    DWindow.alphaBufferSize: 8

    Button {
        text: "btn"
//        onClicked: test.show()
        onClicked: {
            test.show()
        }
    }

    Example_1 {
        id: test
    }

//    Menu {
//        id: searchAndArrowMenu
//        MenuItem { text: qsTr("Greek(cp869)") }
//        MenuItem { text: qsTr("Cyrillic (ISO 8859-5)") }
//        MenuItem { text: qsTr("Cyrillic(KOI8-R)") }
//        MenuItem { text: qsTr("Devanagari(x-mac-davanagari)") }
//        MenuItem { text: qsTr("Gurmukhi(x-mac-gurmukhi)") }
//        MenuItem { text: qsTr("Thai (ISO 8859-11)") }
//    }

//     Window {
//            id: test
//            width: 400
//            flags: Qt.Window
//            minimumHeight: 120
//            maximumHeight: 240
//            onClosing: {
//    //            close.accepted = false
//                console.log("**************----------")
//                hide()
//            }

//            Button {
//                id: btn
//                text: "ddd"
//                onClicked: Window.window.close()
//                background: Rectangle {
//                    color: btn.hovered ? "red" : "transparent"
//                    width: 100
//                    height: 100
//                }
//            }
//        }


//    property bool showErrorDetail
//    DialogWindow {
//            id: test
//            width: 400
//            minimumHeight: 120
//            maximumHeight: 240
//            icon: "music"
//            title: showErrorDetail ? "错误信息:": ""

//            onClosing: {
//                console.log("********visible window8888888888", close.accepted)
//            }
//            ColumnLayout {
//                width: parent.width
//                Label {
//                    visible: !showErrorDetail
//                    Layout.alignment: Qt.AlignHCenter
//                    font: DTK.fontManager.t5
//                    text: "  这里显示简要出错信息XXXXXXXXXXX"
//                }
//                ScrollView {
//                    visible: showErrorDetail
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 134
//                    TextArea {
//                        selectByMouse: true
//                        wrapMode: Text.WordWrap
//                        text: "VM Regions Near 0x100000002:
//    -->
//    __TEXT                 000000010f96f000-0000000110085000 [ 7256K] r-x/rwx SM=COW  /Applications/Adobe Illustrator CC 2018/Adobe Illustrator.app/Contents/MacOS/CEPHtmlEngine/CEPHtmlEngine.app/Contents/MacOS/CEPHtmlEngine

//    Thread 0 Crashed:: CrBrowserMain  Dispatch queue: com.apple.main-thread
//    0   org.chromium.ContentShell.framework	0x0000000118abe3d4 base::subtle::RefCountedThreadSafeBase::HasOneRef() const + 4
//    1   org.chromium.ContentShell.framework	0x0000000118abfd4e base::internal::WeakReferenceOwner::GetRef() const + 30
//    2   org.chromium.ContentShell.framework	0x000000011889b84c CefCopyFrameGenerator::OnCopyFrameCaptureCompletion(bool) + 92
//    3   org.chromium.ContentShell.framework	0x000000011889badc CefCopyFrameGenerator::CopyFromCompositingSurfaceFinishedProxy(base::WeakPtr<CefCopyFrameGenerator>, std::__1::unique_ptr<cc::SingleReleaseCallback, std::__1::default_delete<cc::SingleReleaseCallback> >, gfx::Rect const&, std::__1::unique_ptr<SkBitmap, std::__1::default_delete<SkBitmap> >, std::__1::unique_ptr<SkAutoLockPixels, std::__1::default_delete<SkAutoLockPixels> >, bool) + 252
//    4   org.chromium.ContentShell.framework	0x000000011889be51 void base::internal::FunctorTraits<void (*)"
//                    }
//                }
//                RowLayout {
//                    Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
//                    Layout.bottomMargin: 10
//                    Button {
//                        text: showErrorDetail ? "隐藏详情" : "显示详情"
//                        Layout.preferredWidth: 175
//                        onClicked: showErrorDetail = !showErrorDetail
//                    }
//                    Item {Layout.fillWidth: true}
//                    Button {
//                        text: "报告错误"
//                        Layout.preferredWidth: 175
//                    }
//                }
//            }
//        }

}

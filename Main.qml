import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: wsModel
        ListElement { wsid: 1 }
        ListElement { wsid: 2 }
        ListElement { wsid: 3 }
        ListElement { wsid: 4 }
        ListElement { wsid: 5 }
        ListElement { wsid: 6 }
        ListElement { wsid: 7 }
        ListElement { wsid: 8 }
    }

    ListView {
        id: wsView
        model: wsModel
        anchors.fill: parent
        spacing: 10
        visible: true
        orientation: ListView.Horizontal
        highlightFollowsCurrentItem: false
        highlight: Rectangle {
            x: wsView.currentItem.x
            Behavior on x {
                NumberAnimation {
                    duration: 3000
                    easing.type: Easing.OutExpo
                }
            }
        }
        move: Transition {
            NumberAnimation {
                properties: "x"
                duration: 30000
                easing.type: Easing.OutExpo
            }
        }

        // highlightMoveDuration: 400
        highlightRangeMode: ListView.ApplyRange
        snapMode: ListView.SnapOneItem
        delegate: Rectangle {
            required property int wsid
            width: 640
            height: 480
            color: "blue"
            Text {
                anchors.centerIn: parent
                text: wsid
                font.pixelSize: 224
            }
        }
    }

    ListModel {
        id: shortcutModel
        ListElement { shortcut: "Alt+1" }
        ListElement { shortcut: "Alt+2" }
        ListElement { shortcut: "Alt+3" }
        ListElement { shortcut: "Alt+4" }
        ListElement { shortcut: "Alt+5" }
        ListElement { shortcut: "Alt+6" }
        ListElement { shortcut: "Alt+7" }
        ListElement { shortcut: "Alt+8" }
    }

    Repeater {
        model: shortcutModel
        Item {
            id: shortcutDelegate
            required property int index
            required property string shortcut
            Shortcut {
                sequence: shortcutDelegate.shortcut
                onActivated: {
                    wsView.currentIndex = index
                }
            }
        }
    }





}

import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Page {
    id:rootBooking

    header: ToolBar {
        //Material.foreground: "white"
        ToolButton {
            //text: qsTr("Back")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/icons/icons/20x20/back.png"
            onClicked: rootBooking.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: "Rais qabul ro'yxati"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    ListModel {
        id: appModel
        //        ListElement { name: "Music"; icon: "pics/AudioPlayer_48.png" }
        //        ListElement { name: "Movies"; icon: "pics/VideoPlayer_48.png" }
        //        ListElement { name: "Camera"; icon: "pics/Camera_48.png" }
        //        ListElement { name: "Calendar"; icon: "pics/DateBook_48.png" }
        //        ListElement { name: "Messaging"; icon: "pics/EMail_48.png" }
        //        ListElement { name: "Todo List"; icon: "pics/TodoList_48.png" }
        //        ListElement { name: "Contacts"; icon: "pics/AddressBook_48.png" }
        ListElement {
            title: "Azizabonu Isroilova";
            name: "Chorshanba 14:00" }
        ListElement {
            title: "Dadakhon Ortikov";
            name: "Seshanba 11:00" }
        ListElement {
            title: "Anvar Mukimov";
            name: "Seshanba 10:30" }
        ListElement {
            title: "Muslima Yuldasheva";
            name: "Juma 15:00" }


    }

    ListView {
        id: listview
        anchors.fill: parent
        //        Layout.fillWidth: true
        //        Layout.fillHeight: true
        Layout.margins: 10//pane.leftPadding + messageField.leftPadding
        model: appModel
        delegate: Rectangle {
            id : rectangleId
            width : parent.width
            height: textId.implicitHeight+30
            color: "beige"
            border.color: "yellowgreen"
            radius: 5

            Text {
                width : parent.width
                height: parent.height
                id : textId
                anchors.centerIn: parent
                text : title + "\n" + name
                font.pointSize: 13
                wrapMode: Text.WordWrap
                //verticalAlignment: Text.AlignVCenter
                //horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Page {
    id:root

    Drawer{
        id:drawer

        width: Math.min(window.width,window.height)/3*2
        height: window.height

        ListView{
            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate{
                width: parent.width
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked: {
                    drawer.close()
                    model.triggered()
                }
            }

            model: ListModel{
                ListElement {
                    text: qsTr("Open...")
                    triggered: function(){ fileOpenDialog.open(); }
                }
                ListElement {
                    text: qsTr("About...")
                    triggered: function(){ aboutDialog.open(); }
                }
            }
            ScrollIndicator.vertical: ScrollIndicator{}
        }
    }
    header: ToolBar{
        //Material.foreground: "white"
        //Material.background: Material.Orange
        ToolButton{
            id:menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/icons/icons/20x20/drawer.png"
            onClicked: drawer.open()
        }
        Label{
            anchors.centerIn: parent
            text: "Mening mahallam"
            font.pixelSize: 20
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
            title: "Info";
            source: "qrc:/pages/About.qml";
            icon: "qrc:/icons/icons/info.png" }
        ListElement {
            title: "Invest";
            source: "qrc:/pages/InvestPage.qml";
            icon: "qrc:/icons/icons/invest2.png" }
        ListElement {
            title: "Gallery";
            source: "qrc:/pages/GalleryPage.qml";
            icon: "qrc:/icons/icons/gallery.png"  }
        ListElement {
            title: "News";
            source: "qrc:/pages/NewsPage.qml";
            icon: "qrc:/icons/icons/news.png"  }
        ListElement {
            title: "Charity";
            source: "qrc:/pages/CharityPage.qml";
            icon: "qrc:/icons/icons/charity.png"  }
        ListElement {
            title: "Obondlashtirish";
            source: "qrc:/pages/ObondlashtirishPage.qml";
            icon: "qrc:/icons/icons/obodonlashtirish.png" }
        ListElement {
            title: "Unemplyment";
            source: "qrc:/pages/UnemplymentPage.qml";
            icon: "qrc:/icons/icons/vacancy.png" }
        ListElement {
            title: "Complains";
            source: "qrc:/pages/ComplainsPage.qml";
            icon: "qrc:/icons/icons/complains.png" }

    }
    GridView {
        anchors.fill: parent
        anchors.margins: 10

        cellWidth: 110; cellHeight: 110
        focus: true
        //clip: true
        model: appModel


        highlight: Rectangle { width: 80; height: 80; color: "lightsteelblue" }

        delegate: Rectangle {
            width: 100; height: 100
//            anchors.centerIn:parent

            border.color: Qt.darker(color, 1.2)



            Image {
                id: myIcon
                y: 20; anchors.horizontalCenter: parent.horizontalCenter
                source: icon
                width: 60
                height: 60
            }
            Text {
                //anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    //verticalCenter: parent.verticalCenter
                    top: myIcon.bottom
                    topMargin: 3
                }
                text: title
            }
            MouseArea {
                anchors.fill: parent

                onClicked:{
                    parent.GridView.view.currentIndex = index
                    stackView.push(model.source)
                }
            }
        }
    }
}

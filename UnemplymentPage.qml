import QtGraphicalEffects 1.0
import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
Rectangle{
    width: 500
    height: 500
    color: "white"


    Rectangle {
        id: rect_withShadow
        width: 200
        height: 150
        radius: 5
        anchors.centerIn: parent
        color: "gray"

        Rectangle{

            id: rec_Shadow
            height:rect_withShadow.height
            width: rect_withShadow.width
            border.color: "#B3B3B3"
            color: "lightblue"

            anchors{
                    verticalCenter: rect_withShadow.verticalCenter
                    horizontalCenter:  rect_withShadow.horizontalCenter
                    horizontalCenterOffset: 5
                    verticalCenterOffset: 5
                }
            radius: rect_withShadow.radius
        }
    }
}

//import QtQuick 2.0
//import QtQuick.Controls 2.12
//import QtQuick.Controls.Material 2.12
//import QtQuick.Layouts 1.12

//Page {
//    id:root
//    header: ToolBar {
//        ToolButton {
//            //text: qsTr("Back")
//            anchors.left: parent.left
//            anchors.verticalCenter: parent.verticalCenter
//            icon.source: "qrc:/icons/icons/20x20/back.png"
//            onClicked: root.StackView.view.pop()
//        }

//        Label {
//            id: pageTitle
//            text: "Mahalla haqida"
//            font.pixelSize: 20
//            anchors.centerIn: parent
//        }
//    }

//    Text {
//        id: name
//        text: qsTr("text")
//    }

//}

import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Page {
    id:root
    header: ToolBar {
        ToolButton {
            //text: qsTr("Back")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/icons/icons/20x20/back.png"
            onClicked: root.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: "Yangiliklar"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    Text {
        id: name
        text: qsTr("text")
    }

}

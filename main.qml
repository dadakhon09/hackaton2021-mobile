import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id:window

    width: 350
    height: 520
    visible: true

    StackView{
        id: stackView
        anchors.fill: parent
        initialItem: HomePage{}
    }

}



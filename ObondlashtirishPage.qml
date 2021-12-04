import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Page {
    id:rootObond

    header: ToolBar {
        //Material.foreground: "white"
        ToolButton {
            //text: qsTr("Back")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/icons/icons/20x20/back.png"
            onClicked: rootObond.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: "Obondlashtirish"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }
    ListModel {
        id: model
    }

    ListView {
        id: listview
        anchors.fill: parent
        model: model
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
                text : listdata //Or modelData
                font.pointSize: 13
                wrapMode: Text.WordWrap
                //verticalAlignment: Text.AlignVCenter
                //horizontalAlignment: Text.AlignHCenter
            }
        }

//            Text {
//            text: listdata
//        }
    }

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://mening-mahallam.herokuapp.com/api/streets/";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                myFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function myFunction(response) {
        var arr = JSON.parse(response);
        for(var i = 0; i < arr.length; i++) {
            listview.model.append( {listdata: arr[i].name +"\n "+ arr[i].description })
        }
    }

    Button {
        anchors.bottom: parent.bottom
        width: parent.width
        text: "Get Data"
        onClicked: getData()
    }

}

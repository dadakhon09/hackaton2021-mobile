import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Page {
    id:rootAbout


    property string nameM;
    property string districtM: qsTr("")
    property string addressM: qsTr("")
    property string lengthM: qsTr("")
    property string squareM: qsTr("")
    property string phoneM: qsTr("")
    property string chairmanM: qsTr("")
    property string descritionM: qsTr("")

    header: ToolBar {
        //Material.foreground: "white"
        ToolButton {
            //text: qsTr("Back")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/icons/icons/20x20/back.png"
            onClicked: rootAbout.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: "Mahalla haqida"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://mening-mahallam.herokuapp.com/api/about/153";
        var res;

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                myFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function myFunction(json) {
        var obj = JSON.parse(json);
        nameM=obj.name
        districtM=obj.district
        addressM=obj.address
        lengthM=obj.length
        squareM=obj.square
        phoneM=obj.phone
        chairmanM=obj.chairman
        descritionM=obj.description

    }


    Label {
        id: labelNameId
        anchors{
            topMargin: 15
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        text: nameM
        font.pixelSize: 20
        font.bold: true
    }

    Rectangle{
        id: rectLineId
        anchors{
            top: labelNameId.bottom
            horizontalCenter: parent.horizontalCenter
        }
        height: 2
        width: parent.width-20
        color: "steelblue"
    }

    Image {
        id: image
        anchors{
            top: rectLineId.bottom
            topMargin: 15
            horizontalCenter: parent.horizontalCenter
        }

        source: "qrc:images/photo1.jpeg"

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: image.width
                height: image.height
                Rectangle {
                    anchors.centerIn: parent
                    width: image.adapt ? image.width : Math.min(image.width, image.height)
                    height: image.adapt ? image.height : width
                    radius: Math.min(width, height)
                }
            }
        }
    }

    Label {
        id: labelDistrictId
        anchors{
            topMargin: 5
            top: image.bottom
            horizontalCenter: parent.horizontalCenter
        }

        text: "Tuman: " + districtM
        font.pixelSize: 15
        font.bold: true
    }

    Label {
        id: labelAddressId
        anchors{
            topMargin: 5
            top: labelDistrictId.bottom
            horizontalCenter: parent.horizontalCenter
        }

        text: "Manzil: " + addressM
        font.pixelSize: 15
        font.bold: true
    }

    Label {
        id: labelLengthId
        anchors{
            topMargin: 5
            top: labelAddressId.bottom
            horizontalCenter: parent.horizontalCenter
        }

        text: "Uzunligi: " + lengthM
        font.pixelSize: 15
        font.bold: true
    }

    Label {
        id: labelSquareId
        anchors{
            topMargin: 5
            top: labelLengthId.bottom
            horizontalCenter: parent.horizontalCenter
        }

        text: "Maydoni: " + squareM
        font.pixelSize: 15
        font.bold: true
    }

    Label {
        id: labelPhoneId
        anchors{
            topMargin: 5
            top: labelSquareId.bottom
            horizontalCenter: parent.horizontalCenter
        }

        text: "Telefon: " + phoneM
        font.pixelSize: 15
        font.bold: true
    }

    Label {
        id: labelChairmanId
        anchors{
            topMargin: 5
            top: labelPhoneId.bottom
            horizontalCenter: parent.horizontalCenter
        }

        text: "Rahbar: " + chairmanM
        font.pixelSize: 15
        font.bold: true
    }

    Rectangle{
        id: rectLine2Id
        anchors{
            top: labelChairmanId.bottom
            topMargin: 15
            horizontalCenter: parent.horizontalCenter
        }
        height: 2
        width: parent.width-20
        color: "steelblue"
    }

    Label {
        id: labelDescriptionnId
        anchors{
            topMargin: 5
            top: rectLine2Id.bottom
            left: parent.left
        }

        text: "Tavsifi: " + descritionM
        font.pixelSize: 15
        font.bold: true
    }

    //rest api get function
    //    ListModel {
    //            id: model
    //        }

    //        ListView {
    //            id: listview
    //            anchors.fill: parent
    //            model: model
    //            delegate: Text {
    //                text: jsondata
    //            }
    //        }

    Button {
        anchors.bottom: parent.bottom
        width: parent.width
        text: "GET Data"
        onClicked: getData()
    }
}


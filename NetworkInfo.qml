import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id:root
    width: 300
    height: 200
    visible: true
    title: qsTr("Informacje o połączeniu")
    Material.theme: Material.Dark
    Material.accent: Material.Purple
Column{
    anchors {
        centerIn: parent
        horizontalCenter: parent.horizontalCenter
    }
    spacing:20
    Frame {
        id:adresIP
        width:root.width/1.5
        background: Rectangle {
            color: "transparent"
            border.color: "White"
            border.width: 3
            radius: 10
        }
        Column {
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Adres IP:")
                font.pixelSize: adresIP.width/12
                color:"White"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr(kuba.adress)
                font.pixelSize: adresIP.width/12
                color:"White"
            }
        }
    }

    Frame {
        id:port
        width:root.width/1.5
        background: Rectangle {
            color: "transparent"
            border.color: "White"
            border.width: 3
            radius: 10
        }
        Column {
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Port:")
                font.pixelSize: port.width/12
                color:"White"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: kuba.port
                font.pixelSize: port.width/12
                color:"White"
            }
        }
    }

}
}





import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id:root
    width: 300
    height: 200
    visible: true
    title: qsTr("Ustawienia")
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    property alias myValue: controlLevel.value

Column{
    anchors {
        centerIn: parent
        horizontalCenter: parent.horizontalCenter
    }
    spacing:20
    Label{
         anchors.horizontalCenter: parent.horizontalCenter

        text:qsTr("Ustaw skale okna:")
        font.pixelSize: parent.width/12
    }
    Slider {
        id: controlLevel
        //property int myValue:50
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        enabled: true

        from: 1920; to: Screen.width; stepSize: 1
        value: to * 0.5

        ToolTip {
            parent: controlLevel.handle
            visible: controlLevel.pressed
            text: controlLevel.value.toFixed(1)
        }
    }
}
}





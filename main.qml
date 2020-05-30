import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.14
import QtQuick.Window 2.2
import QtCharts 2.14
ApplicationWindow {
    id: root

    minimumWidth: slider.myValue; minimumHeight: 0.5625*slider.myValue
    maximumWidth: slider.myValue; maximumHeight: 0.5625*slider.myValue
    width: slider.myValue
    /// The text height of the element
    height: 0.5625*slider.myValue
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    title: qsTr("Sterowanie symulowanym pojazdem")
    //property alias itemLoader:settingsWindow.item
    //        Loader {
    //            id:settingsWindow
    //            //anchors.fill: samochod
    //            focus:true
    //        }
    //                    Connections{
    //                         target: settingsWindow
    //                         onLoaded:{
    //                                     console.log("Loaded");
    //                                     console.log(itemLoader.myValue);
    //                                     console.log(qsTr('Clicked on background. Text: "'))
    //                                 }
    //                    }

    CarBackground{
        id:carbackground
        anchors.fill:parent
        visible: true
    }

    ChartRho{
        id: chartrho
        visible: false
    }
    ChartSpeed{
        id: chartspeed
        visible: false
    }
    ChartAccelerometer{
        id: chartdata
        visible: false
    }

    SettingsWindow{
        id:slider
        visible: false

    }
    NetworkInfo{
        id:networkinfo
        visible: false
    }

    // OKNO StARTOWE APLIKACJI
    Item {

        id:okno
        anchors.fill: parent
        visible: true
        //        Column {

        //            anchors.top: car.bottom
        //            //anchors.centerIn: parent
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            RadioButton { text: "Small"}
        //            RadioButton { text: "Medium" }
        //            RadioButton { text: "Large" }
        //        }


        Label{
            anchors{
                horizontalCenter:  parent.horizontalCenter
                top: parent.top
            }
            topPadding: parent.height/10
            text:qsTr("Sterowanie symulowanym pojazdem")
            font.pixelSize: parent.width/26
        }

        Column {
            id: kolumna

            anchors {
                centerIn: okno
                horizontalCenter: okno.horizontalCenter
            }

            spacing: 20


            Button {
                id:sterowanie
                width:root.width/6 + 20
                height:root.height/12
                Label{
                    anchors.centerIn: parent
                    text:qsTr("Rozpocznij Sterowanie")
                    font.pixelSize: parent.width/12
                }

                onClicked:
                {
                    //pojazdLoader.source = ""
                    //pojazdLoader.source = "qrc:/CarScene.qml"
                    //arrowLoader.source = "qrc:/ArrowScene.qml"
                    pojazdLoader.visible = true
                    arrowLoader.visible = true
                    okno.visible = false
                    oknosterowania.visible = true
                    carbackground.visible = false
                }
            }
            Row {
                anchors.horizontalCenter: kolumna.horizontalCenter
                spacing:20

                Button {
                    id:info
                    width:root.width/6 + 20
                    height:root.height/12
                    Label{
                        anchors.centerIn: parent
                        text:qsTr("Informacje o połączeniu")
                        font.pixelSize: parent.width/12
                    }
                    onClicked: {
                        networkinfo.visible = true
                        networkinfo.x = root.width/2 + networkinfo.width
                        networkinfo.y = root.height/2
                    }
                }
            }

            Frame {
                id:networkFrame
                width:sterowanie.width
                background: Rectangle {
                    color: "transparent"
                    border.color: "White"
                    border.width: 3
                    radius: width/8
                }
                Column {
                    anchors.fill: parent
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Status Połączenia:")
                        font.pixelSize: networkFrame.width/12
                        color:"White"
                    }
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing:20
                        Button {
                            width:networkFrame.width/2 -30
                            height:networkFrame.width/4
                            icon.source: "qrc:/Icons/networkON.png"
                            icon.width:width/2
                            icon.height: height/2
                            icon.color:kuba.receive ? "green" : "white"


                            //                            Label{
                            //                                anchors.centerIn: parent

                            //                                text:qsTr("Połączono")
                            //                                font.pixelSize: parent.width/10
                            //                            }
                        }
                        Button {
                            width:networkFrame.width/2 -30
                            height: networkFrame.width/4
                            icon.source: "qrc:/Icons/networkOFF.png"
                            icon.width:width/2
                            icon.height: height/2
                            icon.color:kuba.receive ? "white" : "red"
                            //                            Label{
                            //                                anchors.centerIn: parent
                            //                                text:qsTr("Nie Połączono")
                            //                               font.pixelSize: parent.width/10
                            //                            }
                        }
                    }
                }
            }


        }


        Button {
            id:ustawienia
            anchors{
                bottom:okno.bottom
                right: okno.right
                rightMargin: 30
                bottomMargin: 30
            }
            width: root.width/10
            height: root.height/12
            Label{
                anchors.centerIn: ustawienia
                text:qsTr("Ustawienia")
                font.pixelSize: ustawienia.width/8
            }
            onClicked: {
                slider.visible=true
                slider.x = ustawienia.x
                slider.y = ustawienia.y  - ustawienia.height
            }

        }

        Button {
            id: zamknij
            anchors{
                bottom:okno.bottom
                left:okno.left
                leftMargin: 30
                bottomMargin: 30
            }
            width: root.width/10
            height: root.height/12
            Label{
                anchors.centerIn: zamknij
                text:qsTr("Zamknij")
                font.pixelSize: zamknij.width/8
            }
            onClicked:{
               close()
            }
        }
    }


    //OKNO STEROWANIA POJAZDEM
    Item{
        id:oknosterowania
        anchors.fill:parent
        visible:false

        Item {
            id: prawaramka
            width:oknosterowania.width/6
            height:oknosterowania.height
            anchors {
                right:oknosterowania.right
            }

            Column {
                id:topright
                anchors.horizontalCenter: prawaramka.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 30
                spacing: 15

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: qsTr("Akcelerometr:")
                    font.pixelSize: prawaramka.width/10
                    color:"White"
                }

                Frame {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:prawaramka.width/1.5

                    background: Rectangle {
                        color: "transparent"
                        border.color: "White"
                        border.width: 3
                        radius: width/8
                    }
                    Column{
                        anchors.fill: parent
                        spacing: 15

                        Row{
                            spacing: prawaramka.width/30
                            Text {
                                leftPadding: prawaramka.width/8
                                text: qsTr("Ax: ")
                                font.pixelSize: prawaramka.width/15
                                color:"White"
                            }
                            Text {
                                text: parseInt(kuba.Ax*100)/100
                                font.pixelSize: prawaramka.width/15
                                color:"White"
                            }
                        }
                        Row{
                            spacing:prawaramka.width/30
                            Text {
                                leftPadding: prawaramka.width/8
                                text: qsTr("Ay: ")
                                font.pixelSize: prawaramka.width/15
                                color:"White"
                            }
                            Text {
                                text: parseInt(kuba.Ay*100)/100
                                font.pixelSize: prawaramka.width/15
                                color:"White"
                            }
                        }

                    }
                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:lewaramka.width/2
                    height: width/3
                    Label{
                        anchors.centerIn: parent

                        text:qsTr("Historia danych")
                        font.pixelSize: parent.width/10
                    }
                    onClicked: {
                        chartdata.visible = true
                    }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    topPadding: prawaramka.height/14 - 45
                    text: qsTr("Kierowanie:")
                    font.pixelSize: prawaramka.width/10
                    color:"White"
                }
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing:prawaramka.width/30
                    Button {
                        width:prawaramka.width/2 - 15
                        height:prawaramka.width/4

                        Label{
                            anchors.centerIn: parent
                            text:qsTr("On")
                            font.pixelSize: parent.width/5
                            color:kuba.Conect ? "green" : ""
                            font.bold:true
                        }
                        onClicked:{
                            kuba.Conect = true
                        }
                    }

                    Button {
                        width:prawaramka.width/2 - 15
                        height:prawaramka.width/4
                        Label{
                            anchors.centerIn: parent
                            text:qsTr("Off")
                            font.pixelSize: parent.width/5
                            color:kuba.Conect ? "" : "red"
                            font.bold:true
                        }
                        onClicked:{
                            kuba.Conect = false
                        }
                    }
                }
            }
            Column {
                anchors.horizontalCenter: prawaramka.horizontalCenter
                anchors.top: topright.bottom
                anchors.topMargin: prawaramka.height/10

                spacing: 15

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: qsTr("Prędkość:")
                    font.pixelSize: prawaramka.width/10
                    color:"White"
                }

                Frame {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:prawaramka.width/2
                    height:width
                    background: Rectangle {
                        color: "transparent"
                        border.color: "White"
                        border.width: 3
                        radius: width/8
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.centerIn: parent
                        text: kuba.Conect? qsTr(Math.abs(parseInt(10*kuba.Ay/9.81*100)/100) + " m/s"): qsTr(0 + " m/s")
                        font.pixelSize: prawaramka.width/15
                        color:"White"
                    }
                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:lewaramka.width/2
                    height: width/3
                    Label{
                        anchors.centerIn: parent

                        text:qsTr("Historia prędkości")
                        font.pixelSize: parent.width/10
                    }
                    onClicked: {
                        chartspeed.visible = true
                    }
                }
            }
            Column {
                anchors.horizontalCenter: prawaramka.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: prawaramka.height/15
                spacing: 15
                Button {
                    id: ustawienia2
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }

                    width: root.width/10
                    height: width/2
                    Label{
                        anchors.centerIn: ustawienia2
                        text:qsTr("Ustawienia")
                        font.pixelSize: ustawienia2.width/8
                    }
                    onClicked:{
                        slider.visible=true
                        slider.x = ustawienia.x
                        slider.y = ustawienia.y  - ustawienia.height
                    }
                }
            }
        }
        Item {
            id: samochod
            width:4/6*oknosterowania.width
            height:oknosterowania.height
            anchors {
                right:prawaramka.left
            }
            CarScene {
                id: pojazdLoader
                anchors.fill: samochod
                //focus:true
                visible: false
            }
        }
        Item {
            id: lewaramka
            width:oknosterowania.width/6
            height:oknosterowania.height
            anchors {
                left:oknosterowania.left
            }

            Column {
                id:topleft
                anchors.horizontalCenter: lewaramka.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 30

                spacing: 15


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Kierunek skrętu:")
                    font.pixelSize: lewaramka.width/10
                    color:"White"
                }
                Frame {
                    id:arrow
                    width:lewaramka.width
                    height:width
                    background: Rectangle {
                        id:back
                        color: "transparent"
                        border.color: "White"
                        border.width: 3
                        radius: width/8
                        ArrowScene {
                            id: arrowLoader
                            anchors.fill: back
                            anchors.leftMargin: back.width/10
                            anchors.rightMargin: back.width/10
                            anchors.topMargin: 10
                            anchors.bottomMargin:10
                            //focus:true
                            visible: false
                        }
                    }
                }
            }

            Column {
                anchors.horizontalCenter: lewaramka.horizontalCenter
                anchors.top: topleft.bottom
                anchors.topMargin: lewaramka.height/9

                spacing: 15
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: qsTr("Kąt skrętu:")
                    font.pixelSize: lewaramka.width/10
                    color:"White"
                }

                Frame {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:lewaramka.width/2
                    height:width
                    background: Rectangle {
                        color: "transparent"
                        border.color: "White"
                        border.width: 3
                        radius: width/8
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.centerIn: parent
                        text: qsTr(parseInt(40*kuba.Ax/9.81*100)/100 + " stopni")
                        font.pixelSize: lewaramka.width/15
                        color:"White"
                    }
                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:lewaramka.width/2
                    height: width/3
                    Label{
                        anchors.centerIn: parent

                        text:qsTr("Historia skrętów")
                        font.pixelSize: parent.width/10
                    }
                    onClicked: {
                        chartrho.visible = true
                    }
                }
            }
            Column {
                anchors.horizontalCenter: lewaramka.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: lewaramka.height/15
                spacing: 15

                Button {
                    id: zamknij2
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: root.width/10
                    height: width/2
                    Label{
                        anchors.centerIn: zamknij2
                        text:qsTr("Zamknij")
                        font.pixelSize: zamknij2.width/8
                    }
                    onClicked:{
                        close()
                    }
                }
            }

        }
    }
}



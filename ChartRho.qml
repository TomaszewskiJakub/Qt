import QtQuick 2.0
import QtCharts 2.14
import QtQuick.Controls 2.12
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.12
ApplicationWindow{
    id:root
    width: 600
    height: 600
    visible: true
    title: qsTr("Historia skrętów")
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    ChartView {
        id:rhochart
        title: "Historia skrętów"
        anchors.fill: parent
        antialiasing: true
        animationOptions: ChartView.SeriesAnimations
        theme: ChartView.ChartThemeDark
        property int licznik : 0

        ValueAxis {
            id: xAxis
            min: 0
            max: 3
            tickCount: 10
            labelFormat: "%.1f"

        }

        ValueAxis {
            id: yAxis
            min: -40
            max: 40
            tickCount: 10
        }

        SplineSeries {
            id: spline
            name: "wartość kąta"
            color: "red"
            axisX: xAxis
            axisY: yAxis
            width: 3
        }

    }


    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: getData()
    }


    function getData() {

        if(kuba.Conect && kuba.receive){

            spline.append(rhochart.licznik/10, 40*kuba.Ax/9.81)
            if (rhochart.licznik>30) {
                spline.axisX.max += 0.1
                //spline.axisX.min ++
            }
            if (rhochart.licznik>300) {
                spline.axisX.min +=0.1
            }
            rhochart.licznik++
        }
    }
}

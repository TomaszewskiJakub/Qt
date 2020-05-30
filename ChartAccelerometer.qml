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
    title: qsTr("Historia danych")
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    ChartView {
        id:rhochart
        title: "Historia danych z akcelerometru"
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
            min: -10
            max: 10
            tickCount: 10
        }

        SplineSeries {
            id: spline
            name: "Ax"
            color: "green"
            axisX: xAxis
            axisY: yAxis
            width: 3
        }
        SplineSeries {
            id: spline2
            name: "Ay"
            color: "orange"
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

            spline.append(rhochart.licznik/10, kuba.Ax)
            spline2.append(rhochart.licznik/10, kuba.Ay)
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

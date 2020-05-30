import QtQuick 2.14 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0


import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0
import QtQml 2.14

import QtQuick 2.0

Item {
    visible: true
    width: 2000
    height: 1200
    //title: qsTr("Test")
    //color: "green"


    Scene3D {
        anchors.fill: parent

        focus: true
        z: 0
        id: sc

        Entity {
            id: root

            // Render from the mainCamera
            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        id: renderer
                        camera: mainCamera
                        clearColor: Qt.rgba(0.25, 0.25, 0.25, 1)
                    }
                },

                // Event Source will be set by the Qt3DQuickWindow
                InputSettings { }
            ]




            BasicCamera {
                id: mainCamera
                position: Qt.vector3d(os_Obrotu.x-20, os_Obrotu.y, 18)
                viewCenter: Qt.vector3d(os_Obrotu.x, os_Obrotu.y, os_Obrotu.z)
            }

            FirstPersonCameraController { camera: mainCamera }



            ObjectMaterial {
                id: objectMaterial
                effect: ObjectEffect {}


                ambient: Qt.rgba( 0.2, 0.0, 0.0, 1.0 )
                diffuse: Qt.rgba( 0.8, 0.0, 0.0, 1.0 )

                //       OPCJONALNA ANIMACJA MATERIALU
                //                                QQ2.SequentialAnimation {
                //                                    loops: QQ2.Animation.Infinite
                //                                    running: true

                //                                    QQ2.NumberAnimation {
                //                                        target: objectMaterial;
                //                                        property: "lineWidth";
                //                                        duration: 1000;
                //                                        from: 0.8
                //                                        to: 1.8
                //                                    }

                //                                    QQ2.NumberAnimation {
                //                                        target: objectMaterial;
                //                                        property: "lineWidth";
                //                                        duration: 1000;
                //                                        from: 1.8
                //                                        to: 0.8
                //                                    }

                //                                    QQ2.PauseAnimation { duration: 1500 }
                //                                }

            }
            ObjectMaterial {
                id: powierzchniaMaterial
                effect: ObjectEffect {}


                ambient: Qt.rgba( 0.1, 0.2, 0.4, 1.0 )
                diffuse: Qt.rgba( 0.1, 0.2, 0.4, 1.0 )
            }
            ObjectMaterial {
                id: pienMaterial
                effect: ObjectEffect {}


                ambient: Qt.rgba( 0.34, 0.17, 0.07, 1.0 )
                diffuse: Qt.rgba( 0.34, 0.17, 0.07, 1.0 )
            }
            ObjectMaterial {
                id: koronaMaterial
                effect: ObjectEffect {}


                ambient: Qt.rgba( 0.0, 0.3, 0.05, 1.0 )
                diffuse: Qt.rgba( 0.0, 0.3, 0.05, 1.0 )
            }



            QQ2.SequentialAnimation {
                //loops: QQ2.Animation.Infinite
                onStopped: start() //Sprawia że animowane wartości sa aktualizowane
                running: true
                QQ2.NumberAnimation {
                    target: os_Obrotu;
                    property: "x"
                    duration: 1;
                    from: os_Obrotu.x
                    to: os_Obrotu.x +  Math.cos(((os_Obrotu.rho+os_Obrotu.alpha)*2*Math.PI)/360)*os_Obrotu.carspeed*0.001*16.665 //16.665 to błąd wynikający z duration -> patrz niżej
                }
            }

            QQ2.SequentialAnimation {
                //loops: QQ2.Animation.Infinite
                onStopped: start() //Sprawia że animowane wartości sa aktualizowane
                running: true
                QQ2.NumberAnimation {
                    target: os_Obrotu;
                    property: "y";
                    duration: 1;
                    from: os_Obrotu.y
                    to: os_Obrotu.y +  Math.sin(((os_Obrotu.rho+os_Obrotu.alpha)*2*Math.PI)/360)*os_Obrotu.carspeed*0.001*16.665
                }

            }

            QQ2.SequentialAnimation {
                //loops: QQ2.Animation.Infinite
                onStopped: start() //Sprawia że animowane wartości sa aktualizowane
                running: true
                QQ2.NumberAnimation {
                    target: os_Obrotu;
                    property: "alpha";
                    duration: 1;
                    from: os_Obrotu.alpha
                    to: os_Obrotu.alpha +  (os_Obrotu.carspeed*360)/((2*Math.PI*168.987*os_Obrotu._scale)/Math.sin(((os_Obrotu.rho)*2*Math.PI)/360))*0.001*16.665
                }

            }

            QQ2.SequentialAnimation {
                //loops: QQ2.Animation.Infinite
                onStopped: start()
                running: true

                QQ2.NumberAnimation {
                    target: przednie_Kola;
                    property: "obrotkol";
                    duration: 1;
                    from: przednie_Kola.obrotkol
                    to: przednie_Kola.obrotkol + (os_Obrotu.carspeed*360)/(2*Math.PI*32.5*os_Obrotu._scale)*0.001*16.665
                }
            }


            //Blad w czasie duration
            //            QQ2.SequentialAnimation {
            //                //loops: QQ2.Animation.Infinite
            //                onStopped: start() //Sprawia że animowane wartości sa aktualizowane
            //                running: true
            //                //alwaysRunToEnd: true
            //                //onFinished:     console.log(pojazd.x)
            //                QQ2.NumberAnimation {
            //                    target: pojazd;
            //                    property: "x";
            //                    duration: 1000;
            //                    from: pojazd.x
            //                    to:  pojazd.x + 1
            //                }
            //            }

            //            QQ2.SequentialAnimation {
            //                //loops: QQ2.Animation.Infinite
            //                onStopped: start() //Sprawia że animowane wartości sa aktualizowane
            //                running: true

            //                onFinished:     console.log(pojazd1.x-pojazd.x)
            //                QQ2.NumberAnimation {
            //                    target: pojazd1;
            //                    property: "x";
            //                    duration: 1;
            //                    from: pojazd1.x
            //                    to:  pojazd1.x + 0.001*16.665
            //                }

            //            }


            Object{
                id:powierzchnia
                material: powierzchniaMaterial
                _source:"qrc:/Object/Inne/Powierzchnia.obj"
                _scale:0.02
            }
            Object {
                id: pien
                material: pienMaterial
                _source: "qrc:/Object/Inne/Pien.obj"
                _scale:0.005
                y:-1350*_scale
            }
            Object {
                id: korona
                material: koronaMaterial
                _source: "qrc:/Object/Inne/KoronaDrzewa.obj"
                z:300*_scale
                _scale:0.005
            }

            Object {
                id: os_Obrotu
                objectName: "os_Obrotu"
                material: objectMaterial
                _source: "qrc:/Object/Os_Obrotu.obj"
                carspeed: kuba.Conect? 10*kuba.Ay/9.81 : 0
                QQ2.Behavior on rho {QQ2.SmoothedAnimation { velocity: 100}}
                rho:40*kuba.Ax/9.81
            }


            Object {
                id: przednie_Kola
                material: objectMaterial
                _source: "qrc:/Object/Przednie_Kola.obj"
                x: os_Obrotu.x
                y: os_Obrotu.y
                z: os_Obrotu.z
                rho: os_Obrotu.rho
                alpha: os_Obrotu.alpha
                koloz:32.5
            }

            Object {
                id: tylne_Kola
                material: objectMaterial
                _source: "qrc:/Object/Tylne_Kola.obj"
                x: os_Obrotu.x
                y: os_Obrotu.y
                z: os_Obrotu.z
                alpha: os_Obrotu.alpha
                koloz:przednie_Kola.koloz
                kolox:-168.987
                obrotkol: przednie_Kola.obrotkol
            }

            Object {
                id: podwozie
                material: objectMaterial
                _source: "qrc:/Object/Podwozie.obj"
                x: os_Obrotu.x
                y: os_Obrotu.y
                z: os_Obrotu.z
                alpha: os_Obrotu.alpha
            }


        }
    }

}

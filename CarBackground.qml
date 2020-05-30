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
    width: 1200
    height: 2000
    //title: qsTr("Test")
    //color: "green"


    Scene3D {
        anchors.fill: parent
        //anchors.margins: 100
        focus: true
        z: 0
        id: sc
        //opacity: 0.3
        Entity {
            id: root

            // Render from the mainCamera
            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        id: renderer
                        camera: mainCamera
                        clearColor: Qt.rgba(0.19, 0.19, 0.19, 1)
                    }
                },

                // Event Source will be set by the Qt3DQuickWindow
                InputSettings { }
            ]




            BasicCamera {
                id: mainCamera
                position: Qt.vector3d(-7, 0, 4)
                viewCenter: Qt.vector3d( -0.5, 0.0, 0.0 )
                upVector: Qt.vector3d( 1.0, 0.0, 1.0 )
            }

            FirstPersonCameraController { camera: mainCamera }



            ObjectMaterial {
                id: objectMaterial
                effect: ObjectEffect {}


                ambient: Qt.rgba( 0.2, 0.0, 0.0, 1.0 )
                diffuse: Qt.rgba( 0.8, 0.0, 0.0, 1.0 )

                //       OPCJONALNA ANIMACJA MATERIALU
                QQ2.SequentialAnimation {
                    loops: QQ2.Animation.Infinite
                    running: true

                    QQ2.NumberAnimation {
                        target: objectMaterial;
                        property: "lineWidth";
                        duration: 1000;
                        from: 0.5
                        to: 1.5
                    }

                    QQ2.NumberAnimation {
                        target: objectMaterial;
                        property: "lineWidth";
                        duration: 1000;
                        from: 1.5
                        to: 0.5
                    }

                    QQ2.PauseAnimation { duration: 1500 }
                }

            }

            QQ2.SequentialAnimation {
                loops: QQ2.Animation.Infinite
                //onStopped: start()
                running: true

                QQ2.NumberAnimation {
                    target: przednie_Kola;
                    property: "obrotkol";
                    duration: 3000;
                    from: 0
                    to: 360
                }
            }

            //            Object {
            //                id: pojazd
            //                material: objectMaterial
            //                _source: "Object/Pojazd.obj"
            //                alpha: -45

            //            }
            Object {
                id: os_Obrotu
                objectName: "os_Obrotu"
                material: objectMaterial
                _source: "qrc:/Object/Os_Obrotu.obj"
                //x:0.5
                y:-0.5
                z:-0.5
                alpha: -45
            }


            Object {
                id: przednie_Kola
                material: objectMaterial
                _source: "qrc:/Object/Przednie_Kola.obj"
                alpha: os_Obrotu.alpha
                koloz:32.5
                x:os_Obrotu.x
                y:os_Obrotu.y
                z:os_Obrotu.z
            }

            Object {
                id: tylne_Kola
                material: objectMaterial
                _source: "qrc:/Object/Tylne_Kola.obj"
                alpha: os_Obrotu.alpha
                koloz:przednie_Kola.koloz
                kolox:-168.987
                obrotkol: przednie_Kola.obrotkol
                x:os_Obrotu.x
                y:os_Obrotu.y
                z:os_Obrotu.z
            }

            Object {
                id: podwozie
                material: objectMaterial
                _source: "qrc:/Object/Podwozie.obj"
                alpha: os_Obrotu.alpha
                x:os_Obrotu.x
                y:os_Obrotu.y
                z:os_Obrotu.z
            }

        }
    }
}

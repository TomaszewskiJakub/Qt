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
                        clearColor: Qt.rgba(0.19, 0.19, 0.19, 1)
                    }
                },

                // Event Source will be set by the Qt3DQuickWindow
                InputSettings { }
            ]




            BasicCamera {
                id: mainCamera
                position: Qt.vector3d(arrow.x-2, arrow.y, 9)
                viewCenter: Qt.vector3d( -0.5, 0.0, 0.0 )
            }

            FirstPersonCameraController { camera: mainCamera }



            ObjectMaterial {
                id: objectMaterial
                effect: ObjectEffect {}


                ambient: Qt.rgba( 0.2, 0.0, 0.0, 1.0 )
                diffuse: Qt.rgba( 0.8, 0.0, 0.0, 1.0 )
            }
            Object {
                id: arrow
                material: objectMaterial
                _source: "qrc:/Object/Os_Obrotu.obj"

                QQ2.Behavior on rho {QQ2.SmoothedAnimation { velocity: 100}}
                rho:40*kuba.Ax/9.81
            }

            Object {
                id: przednie_Kola
                material: objectMaterial
                _source: "qrc:/Object/Przednie_Kola.obj"
                rho:arrow.rho

            }

            Object {
                id: tylne_Kola
                material: objectMaterial
                _source: "qrc:/Object/Tylne_Kola.obj"

            }

            Object {
                id: podwozie
                material: objectMaterial
                _source: "qrc:/Object/Podwozie.obj"
            }
        }
    }
}

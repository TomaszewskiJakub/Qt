import Qt3D.Core 2.0
import Qt3D.Render 2.0
import QtQuick 2.14
Entity {
    id: root

    property real x: 0.0
    property real y: 0.0
    property real z: 0.0
    property real _scale: 0.01
    property real theta: 0.0
    property real phi: 0.0
    property real rho: 0.0
    property var _source: "file_source"



    components: [ transform, file ]




    Transform {
        id: transform
        translation: Qt.vector3d(root.x, root.y, root.z)
        rotation: fromEulerAngles(theta, phi, rho)
        scale: root._scale


        //scale: root._scale
        //rotation: fromEulerAngles(theta, phi, rho+alpha)
        //translation: Qt.vector3d(root.x, root.y, root.z)
        //onTranslationChanged:   console.log(pojazd1.x)

    }


    SceneLoader {
        id:file
        source: _source
    }
}

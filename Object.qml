import Qt3D.Core 2.0
import Qt3D.Render 2.0
import QtQuick 2.14
Entity {
    id: root

    property real x: 0.0
    property real y: 0.0
    property real z: 0.0
    property real obrotkol: 0.0
    property real kolox: 0.0
    property real koloz: 0.0
    property real _scale: 0.01
    property real theta: 0.0
    property real phi: 0.0
    //rho -> wartośc przyspieszenia względem osi X (w granicach od -40 do 40 stopni)
    property real rho: 0.0
    property real alpha: 0.0
    //carspeed -> wartośc przyspieszenia względem osi Y
    property real carspeed: 0.0
    property Material material
    property var _source: "file_source"



    components: [ transform1, mesh, root.material ]




    Transform {
        id: transform1
        //        translation: Qt.vector3d(root.x, root.y, root.z)
        //        rotation: fromEulerAngles(theta, phi, 0)
        //        scale: root._scale

        // W Matrix wszystkie kolejna przekształcenia odnoszą się do poprzednich
        // Innymi słowy są to przekształcenia względem układów lokalnych aktualnego położenia bryły
        matrix: {
            var m = Qt.matrix4x4()

            //Aby Os i pojazd oracały sie w okół aktalnego położenia
            m.translate(Qt.vector3d(root.x, root.y, root.z))
            m.rotate(rho+alpha, Qt.vector3d(0, 0, 1))
            m.translate(Qt.vector3d(-root.x, -root.y, -root.z))

            m.translate(Qt.vector3d(root.x, root.y, root.z))



            if(obrotkol!=0){
                m.translate(Qt.vector3d(kolox*_scale, 0, koloz*_scale))
                m.rotate(obrotkol, Qt.vector3d(0, 1, 0))
                m.translate(Qt.vector3d(-kolox*_scale, 0, -koloz*_scale))
            }
            m.scale(_scale)
            return m;
        }

        //scale: root._scale
        //rotation: fromEulerAngles(theta, phi, rho+alpha)
        //translation: Qt.vector3d(root.x, root.y, root.z)
        //onTranslationChanged:   console.log(root.x)

    }


    Mesh {
        id: mesh
        source: _source
    }
}

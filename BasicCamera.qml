import Qt3D.Core 2.0
import Qt3D.Render 2.0

Camera {
    id: mainCamera
    projectionType: CameraLens.PerspectiveProjection
    fieldOfView: 22.5
    //aspectRatio: _window.width / _window.height
    aspectRatio:sc.width/sc.height  
    nearPlane:   0.01
    farPlane:    1000.0
    viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    //viewCenter: Qt.vector3d(os_Obrotu.x, os_Obrotu.y, os_Obrotu.z)
    upVector:   Qt.vector3d( 1.0, 0.0, 1.0 )
}







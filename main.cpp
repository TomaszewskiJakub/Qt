#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <Qt3DQuick/QQmlAspectEngine>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "smartphone_data.h"

#include <QQmlContext>
#include <smartphone_data.h>

#include <QApplication>
#include <QQuickView>

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qputenv("QT_QUICK_CONTROLS_STYLE", "material");
    //QGuiApplication app(argc, argv);
    QApplication app(argc, argv);

    //Qt3DExtras::Quick::Qt3DQuickWindow view;

    // Expose the window as a context property so we can set the aspect ratio
//    view.engine()->qmlEngine()->rootContext()->setContextProperty("_window", &view);
//    view.setSource(QUrl("qrc:/main.qml"));
//    view.show();

    Smartphone_Data kuba;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("kuba", &kuba);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    QQuickView *view = new QQuickView;
//        view->setSource(QUrl(QLatin1String("qrc:/main.qml")));
//        view->show();



      // Step 1: get access to the root object
//      QObject *rootObject = engine.rootObjects().first();
//      QObject *qmlObject = rootObject->findChild<QObject*>("os_Obrotu");

//      // Step 2a: set or get the desired property value for the root object
//         rootObject->setProperty("visible", true);
//         qDebug() << rootObject->property("visible");

      // Step 2b: set or get the desired property value for any qml object
//        qmlObject->setProperty("droga", 0);
//        qDebug() << qmlObject->property("x");


    return app.exec();
}


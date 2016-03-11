#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

#include "dbushelper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<dbushelper>("Dbushelper", 1, 0, "Dbushelper");      //create QML object Mytime (first character has to be UPPERCASE!!) from C++ class


    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/Scaled.qml")));

    view.show();

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/Scaled.qml")));

    return app.exec();
}

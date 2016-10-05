#include <QGuiApplication>
#undef QT_OPENGL_ES_3
#include <QQuickView>
#include <QQmlEngine>
#include "dbushelper.h"

#define HVAC_POC_SURFACE_ID 40
int main(int argc, char *argv[])
{
    setenv("QT_QPA_PLATFORM", "wayland", 1); // force to use wayland plugin
    setenv("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1", 1);
    QGuiApplication app(argc, argv);
    qmlRegisterType<dbushelper>("Dbushelper", 1, 0, "Dbushelper");      //create QML object Mytime (first character has to be UPPERCASE!!) from C++ class
    QQuickView view;
    view.engine()->addImportPath(QCoreApplication::applicationDirPath() + "/imports");
    view.setSource(QUrl(QStringLiteral("qrc:/Main.qml")));
    view.setProperty("IVI-Surface-ID", HVAC_POC_SURFACE_ID);
    view.show();
    return app.exec();
}

#include "dbushelper.h"
#include <QtDBus/QtDBus>
#include <QDebug>

dbushelper::dbushelper()
{
    QDBusConnection::sessionBus().isConnected();

    QDBusConnection::sessionBus().registerService(SERVICE_NAME);

    QDBusConnection::sessionBus().registerObject("/", this, QDBusConnection::ExportAllSlots);

    m_temperature=20;
}


void dbushelper::set_temp(int newTemp){
    m_temperature = newTemp;
    broadcast_temp(newTemp);
    emit temp_changed();

}

int dbushelper::get_temp(){
    return m_temperature;
}

void dbushelper::debug_print(QString myString){
    qDebug()<< myString;
}

void dbushelper::broadcast_temp(int newTemp){
    QString m_path = "/";
    QString m_interface = "qml.sink";
    QString m_member = "QmlSignal";

    QDBusConnection conn = QDBusConnection::sessionBus();
    QDBusMessage signal = QDBusMessage::createSignal(m_path, m_interface, m_member);

    QList<QVariant> list;
    list.append(newTemp);

    if (!list.isEmpty()) {
        signal.setArguments(list);
    }

    if (!conn.send(signal)) {
        qDebug() << qPrintable(conn.lastError().message());
        exit(1);
    }
    else {
        qDebug() << "*sent signal*:" << m_member;
        qDebug() << "with arguments: " << newTemp;
    }

}








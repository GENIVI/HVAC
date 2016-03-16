#include "dbushelper.h"
#include <QtDBus/QtDBus>
#include <QDebug>
#include <QtGlobal>

dbushelper::dbushelper()
{
    QDBusConnection::sessionBus().isConnected();

    QDBusConnection::sessionBus().registerService(SERVICE_NAME);

    QDBusConnection::sessionBus().registerObject("/", this, QDBusConnection::ExportAllSlots);

    leftSeatHeat=0;
    rigthSeatHeat=0;
    leftTemperature=0;
    rightTemperature=0;
    fanSpeed=0;
    fanDown=false;
    fanRight=false;
    fanUp=false;
    fanAC=false;
    fanAuto=false;
    fanRecirc=false;
    defrostMax=false;
    defrostRear=false;
    defrostFront=false;

    maxTemp=30;
    minTemp=15;
    minFan=0;
    maxFan=100;
    maxSeatHeat=3;
    minSeatHeat=0;
}


void dbushelper::set_value(QString zone, double newValue){
    bool newMode = round(qBound(0.0, newValue, 1.0));

    if (zone=="leftSeatHeat"){
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        leftSeatHeat = newValue;
        broadcast_temp(zone, newValue);
        emit leftSeatHeat_changed();
    }
    else if (zone=="rightSeatHeat"){
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        rigthSeatHeat = newValue;
        broadcast_temp(zone, newValue);
        emit rigthSeatHeat_changed();
    }
    if (zone=="leftTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        leftTemperature = newValue;
        broadcast_temp(zone, newValue);
        emit leftTemperature_changed();
    }
    if (zone=="rightTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        rightTemperature = newValue;
        broadcast_temp(zone, newValue);
        emit rightTemperature_changed();
    }
    if (zone=="fanSpeed"){
        newValue = qBound (minFan, newValue, maxFan);
        fanSpeed = newValue;
        broadcast_temp(zone, newValue);
        emit fanSpeed_changed();
    }

    if (zone=="fanDown"){
        fanDown = newMode;
        broadcast_temp(zone, newMode);
        emit fanDown_changed();
    }
    if (zone=="fanRight"){
        fanRight = newMode;
        broadcast_temp(zone, newMode);
        emit fanRight_changed();
    }
    if (zone=="fanUp"){
        fanUp = newMode;
        broadcast_temp(zone, newMode);
        emit fanUp_changed();
    }
    if (zone=="fanAC"){
        fanAC = newMode;
        broadcast_temp(zone, newMode);
        emit fanAC_changed();
    }
    if (zone=="fanAuto"){
        fanAuto = newMode;
        broadcast_temp(zone, newMode);
        emit fanAuto_changed();
    }
    if (zone=="fanRecirc"){
        fanRecirc = newMode;
        broadcast_temp(zone, newMode);
        emit fanRecirc_changed();
    }
    if (zone=="defrostMax"){
        defrostMax = newMode;
        broadcast_temp(zone, newMode);
        emit defrostMax_changed();
    }
    if (zone=="defrostRear"){
        defrostRear = newMode;
        broadcast_temp(zone, newMode);
        emit defrostRear_changed();
    }
    if (zone=="defrostFront"){
        defrostFront = newMode;
        broadcast_temp(zone, newMode);
        emit defrostFront_changed();
    }
}

void dbushelper::QML_value(QString zone, double newValue){

    bool newMode = round(qBound(0.0, newValue, 1.0));

    if (zone=="leftSeatHeat"){
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        leftSeatHeat = newValue;
        broadcast_temp(zone, newValue);
    }
    else if (zone=="rightSeatHeat"){
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        rigthSeatHeat = newValue;
        broadcast_temp(zone, newValue);
    }
    else if (zone=="leftTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        leftTemperature = newValue;
        broadcast_temp(zone, newValue);
    }
    else if (zone=="rightTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        rightTemperature = newValue;
        broadcast_temp(zone, newValue);
    }
    else if (zone=="fanSpeed"){
        newValue = qBound (minFan, newValue, maxFan);
        fanSpeed = newValue;
        broadcast_temp(zone, newValue);
    }
    else if (zone=="fanDown"){
        fanDown = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="fanRight"){
        fanRight = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="fanUp"){
        fanUp = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="fanAC"){
        fanAC = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="fanAuto"){
        fanAuto = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="fanRecirc"){
        fanRecirc = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="defrostMax"){
        defrostMax = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="defrostRear"){
        defrostRear = newMode;
        broadcast_temp(zone, newMode);
    }
    else if (zone=="defrostFront"){
        defrostFront = newMode;
        broadcast_temp(zone, newMode);
    }
}

double dbushelper::get_value(QString zone){
    if (zone=="leftSeatHeat"){
        return leftSeatHeat;
    }
    if (zone=="rigthSeatHeat"){
        return rigthSeatHeat;
    }
    if (zone=="leftTemperature"){
        return leftTemperature;
    }
    if (zone=="rightTemperature"){
        return rightTemperature;
    }
    if (zone=="fanSpeed"){
        return fanSpeed;
    }
    if (zone=="fanDown"){
        return fanDown;
    }
    if (zone=="fanRight"){
        return fanRight;
    }
    if (zone=="fanUp"){
        return fanUp;
    }
    if (zone=="fanAC"){
        return fanAC;
    }
    if (zone=="fanAuto"){
        return fanAuto;
    }
    if (zone=="fanRecirc"){
        return fanRecirc;
    }
    if (zone=="defrostMax"){
        return defrostMax;
    }
    if (zone=="defrostRear"){
        return defrostRear;
    }
    if (zone=="defrostFront"){
        return defrostFront;
    }

}

void dbushelper::debug_print(QString myString){
    qDebug()<< myString;
}

void dbushelper::broadcast_temp(QString zone, double newTemp){
    QString m_path = "/";
    QString m_interface = "qml.sink";
    QString m_member = "QmlSignal";

    QDBusConnection conn = QDBusConnection::sessionBus();
    QDBusMessage signal = QDBusMessage::createSignal(m_path, m_interface, m_member);

    QList<QVariant> list;
    list.append(zone);
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
        qDebug() << "with arguments: " << zone << " " << newTemp;
    }

}








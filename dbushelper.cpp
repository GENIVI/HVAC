#include "dbushelper.h"
#include <QtDBus/QtDBus>
#include <QDebug>
#include <QtGlobal>
#include <string.h>
#include <sstream>

dbushelper::dbushelper()
{
    QDBusConnection::sessionBus().isConnected();

    QDBusConnection::sessionBus().registerService(SERVICE_NAME);

    QDBusConnection::sessionBus().registerObject("/", this, QDBusConnection::ExportAllSlots);

    leftSeatHeat=0;
    rightSeatHeat=0;
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
        broadcast_value(zone, newValue);
        emit leftSeatHeat_changed();
    }
    else if (zone=="rightSeatHeat"){
        qDebug()<< "newVal before="<<newValue << "   ,zone="<<"zone";
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        rightSeatHeat = newValue;
        broadcast_value(zone, newValue);
        emit rightSeatHeat_changed();
    }
    if (zone=="leftTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        leftTemperature = newValue;
        broadcast_value(zone, newValue);
        emit leftTemperature_changed();
    }
    if (zone=="rightTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        rightTemperature = newValue;
        broadcast_value(zone, newValue);
        emit rightTemperature_changed();
    }
    if (zone=="fanSpeed"){
        newValue = qBound (minFan, newValue, maxFan);
        fanSpeed = newValue;
        broadcast_value(zone, newValue);
        emit fanSpeed_changed();
    }

    if (zone=="fanDown"){
        fanDown = newMode;
        broadcast_value(zone, newMode);
        emit fanDown_changed();
    }
    if (zone=="fanRight"){
        fanRight = newMode;
        broadcast_value(zone, newMode);
        emit fanRight_changed();
    }
    if (zone=="fanUp"){
        fanUp = newMode;
        broadcast_value(zone, newMode);
        emit fanUp_changed();
    }
    if (zone=="fanAC"){
        fanAC = newMode;
        broadcast_value(zone, newMode);
        emit fanAC_changed();
    }
    if (zone=="fanAuto"){
        fanAuto = newMode;
        broadcast_value(zone, newMode);
        emit fanAuto_changed();
    }
    if (zone=="fanRecirc"){
        fanRecirc = newMode;
        broadcast_value(zone, newMode);
        emit fanRecirc_changed();
    }
    if (zone=="defrostMax"){
        defrostMax = newMode;
        broadcast_value(zone, newMode);
        emit defrostMax_changed();
    }
    if (zone=="defrostRear"){
        defrostRear = newMode;
        broadcast_value(zone, newMode);
        emit defrostRear_changed();
    }
    if (zone=="defrostFront"){
        defrostFront = newMode;
        broadcast_value(zone, newMode);
        emit defrostFront_changed();
    }
}

void dbushelper::QML_value(QString zone, double newValue){

    bool newMode = round(qBound(0.0, newValue, 1.0));

    if (zone=="leftSeatHeat"){
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        leftSeatHeat = newValue;
        broadcast_value(zone, newValue);
    }
    else if (zone=="rightSeatHeat"){
        newValue = round(qBound (minSeatHeat, newValue, maxSeatHeat));
        rightSeatHeat = newValue;
        broadcast_value(zone, newValue);
    }
    else if (zone=="leftTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        leftTemperature = newValue;
        broadcast_value(zone, newValue);
    }
    else if (zone=="rightTemperature"){
        newValue = qBound (minTemp, newValue, maxTemp);
        rightTemperature = newValue;
        broadcast_value(zone, newValue);
    }
    else if (zone=="fanSpeed"){
        newValue = qBound (minFan, newValue, maxFan);
        fanSpeed = newValue;
        broadcast_value(zone, newValue);
    }
    else if (zone=="fanDown"){
        fanDown = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="fanRight"){
        fanRight = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="fanUp"){
        fanUp = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="fanAC"){
        fanAC = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="fanAuto"){
        fanAuto = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="fanRecirc"){
        fanRecirc = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="defrostMax"){
        defrostMax = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="defrostRear"){
        defrostRear = newMode;
        broadcast_value(zone, newMode);
    }
    else if (zone=="defrostFront"){
        defrostFront = newMode;
        broadcast_value(zone, newMode);
    }
}

double dbushelper::get_value(QString zone){
    if (zone=="leftSeatHeat"){
        return leftSeatHeat;
    }
    if (zone=="rightSeatHeat"){
        return rightSeatHeat;
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

void dbushelper::broadcast_value(QString zone, double newVal){
    QString m_path = "/com/jlr/qmlsink";
    QString m_interface = "com.jlr.hvac";
    QString m_member = "hvac";

    QDBusConnection conn = QDBusConnection::sessionBus();
    QDBusMessage signal = QDBusMessage::createSignal(m_path, m_interface, m_member);

    QString msg;
    int m_value = (int) round(newVal);

    std::string s = std::to_string(m_value);
    msg = "{\"function\":" + zone + ", \"value\":" + s.c_str() +"}";
    QList<QVariant> list;

    list.append(msg);



    if (!list.isEmpty()) {
        signal.setArguments(list);
    }

    if (!conn.send(signal)) {
        qDebug() << qPrintable(conn.lastError().message());
        exit(1);
    }
    else {
        qDebug() << "*sent signal*:" << msg;
    }

}

QString dbushelper::return_status(){
    QString s = "{\"leftSeatHeat\":" + QString::number(leftSeatHeat) + ", \"rightSeatHeat\":" + QString::number(rightSeatHeat) + ", \"leftTemperature\":" + QString::number((int) round(leftTemperature)) + ", \"rightTemperature\":" + QString::number((int) round(rightTemperature)) + ", \"fanSpeed\":" + QString::number((int) round(fanSpeed)) + ", \"fanDown\":" + QString::number(fanDown) + ", \"fanRight\":" + QString::number(fanRight) + ", \"fanUp\":" + QString::number(fanUp) + ", \"fanAC\":" + QString::number(fanAC) + ", \"fanAuto\":" + QString::number(fanAuto) + ", \"fanRecirc\":" + QString::number(fanRecirc) + ", \"defrostMax\":" + QString::number(defrostMax) + ", \"defrostRear\":" + QString::number(defrostRear) + ", \"defrostFront\":" + QString::number(defrostFront) +"}";
    return  s;
}









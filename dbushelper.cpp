#include "dbushelper.h"
#include <QtDBus/QtDBus>
#include <QDebug>

dbushelper::dbushelper()
{
    QDBusConnection::sessionBus().isConnected();

    QDBusConnection::sessionBus().registerService(SERVICE_NAME);

    QDBusConnection::sessionBus().registerObject("/", this, QDBusConnection::ExportAllSlots);

    temperature_leftSeat=20;
    temperature_rightSeat=20;
    temperature_leftSlider=20;
    temperature_rigthSlider=20;
    fanSpeed=50;
    hazards=false;
    fanFeet=false;
    fanFace=false;
    fanWindscreen=false;
    AC=false;
    autoMode=false;
    recycleMode=false;
    heatMax=false;
    heatRear=false;
    heatFront=false;
}


void dbushelper::set_value(QString zone, int newValue){
    if (zone=="leftSeat"){
        temperature_leftSeat = newValue;
        broadcast_temp(zone, newValue);
        emit temp_leftSeat_changed();
    }
    if (zone=="rightSeat"){
        temperature_rightSeat = newValue;
        broadcast_temp(zone, newValue);
        emit temp_rigthSeat_changed();
    }
    if (zone=="leftSlider"){
        temperature_leftSlider = newValue;
        broadcast_temp(zone, newValue);
        emit temp_leftSlider_changed();
    }
    if (zone=="rightSlider"){
        temperature_rigthSlider = newValue;
        broadcast_temp(zone, newValue);
        emit temp_rightSlider_changed();
    }
    if (zone=="fan"){
        fanSpeed = newValue;
        broadcast_temp(zone, newValue);
        emit fanSpeed_changed();
    }
}

void dbushelper::set_mode(QString zone, bool newMode){
    if (zone=="hazards"){
        hazards = newMode;
        emit hazards_changed();
    }
    if (zone=="fanFeet"){
        fanFeet = newMode;
        emit fanFeet_changed();
    }
    if (zone=="fanFace"){
        fanFace = newMode;
        emit fanFace_changed();
    }
    if (zone=="fanWindscreen"){
        fanWindscreen = newMode;
        emit fanWindscreen_changed();
    }
    if (zone=="AC"){
        AC = newMode;
        emit ac_changed();
    }
    if (zone=="autoMode"){
        autoMode = newMode;
        emit autoMode_changed();
    }
    if (zone=="recycleMode"){
        recycleMode = newMode;
        emit recycleMode_changed();
    }
    if (zone=="heatMax"){
        heatMax = newMode;
        emit heatMax_changed();
    }
    if (zone=="heatRear"){
        heatRear = newMode;
        emit heatRear_changed();
    }
    if (zone=="heatFront"){
        heatFront = newMode;
        emit heatFront_changed();
    }

}



int dbushelper::get_value(QString zone){
    if (zone=="leftSeat"){
        return temperature_leftSeat;
    }
    if (zone=="rightSeat"){
        return temperature_rightSeat;
    }
    if (zone=="leftSlider"){
        return temperature_leftSlider;
    }
    if (zone=="rightSlider"){
        return temperature_rigthSlider;
    }
    if (zone=="fan"){
        return fanSpeed;
    }
    if (zone=="hazards"){
        return hazards;
    }
    if (zone=="fanFeet"){
        return fanFeet;
    }
    if (zone=="fanFace"){
        return fanFace;
    }
    if (zone=="fanWindscreen"){
        return fanWindscreen;
    }
    if (zone=="AC"){
        return AC;
    }
    if (zone=="autoMode"){
        return autoMode;
    }
    if (zone=="recycleMode"){
        return recycleMode;
    }
    if (zone=="heatMax"){
        return heatMax;
    }
    if (zone=="heatRear"){
        return heatRear;
    }
    if (zone=="heatFront"){
        return heatFront;
    }

}

void dbushelper::debug_print(QString myString){
    qDebug()<< myString;
}

void dbushelper::broadcast_temp(QString zone, int newTemp){
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








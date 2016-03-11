#ifndef DBUSHELPER_H
#define DBUSHELPER_H
#include <QQuickItem>

#ifndef SERVICE_NAME
#define SERVICE_NAME    "com.jaguarlandrover.HVAC"
#endif // SERVICE_NAME

class dbushelper  : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(int temperature READ get_temp WRITE set_temp NOTIFY temp_changed)


public:
    dbushelper();
    void broadcast_temp(int newTemp);

signals:
    void temp_changed();


public slots:
    Q_SCRIPTABLE void set_temp(int newTemp);
    Q_SCRIPTABLE int get_temp();
    Q_SCRIPTABLE void debug_print(QString myString);


private:
    int m_temperature;

};

#endif // DBUSHELPER_H

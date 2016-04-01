#ifndef DBUSHELPER_H
#define DBUSHELPER_H
#include <QQuickItem>

#ifndef SERVICE_NAME
#define SERVICE_NAME    "com.jlr.hvac"
#endif // SERVICE_NAME

using namespace std;

class dbushelper  : public QQuickItem
{
    Q_OBJECT
//    Q_PROPERTY(int temperature READ get_temp WRITE set_temp NOTIFY temp_changed)


public:
    dbushelper();
    void broadcast_value(QString zone, double newVal);

signals:
    void leftSeatHeat_changed();
    void rightSeatHeat_changed();
    void leftTemperature_changed();
    void rightTemperature_changed();
    void fanSpeed_changed();
    void fanDown_changed();
    void fanRight_changed();
    void fanUp_changed();
    void fanAC_changed();
    void fanAuto_changed();
    void fanRecirc_changed();
    void defrostMax_changed();
    void defrostRear_changed();
    void defrostFront_changed();

public slots:
    Q_SCRIPTABLE void QML_value(QString zone, double newValue);
    Q_SCRIPTABLE void set_value(QString zone, double newValue);
    Q_SCRIPTABLE double get_value(QString zone);
    Q_SCRIPTABLE void debug_print(QString myString);
    Q_SCRIPTABLE QString return_status();


private:
    float leftSeatHeat;
    float rightSeatHeat;
    float leftTemperature;
    float rightTemperature;
    float fanSpeed;
    bool fanDown;
    bool fanRight;
    bool fanUp;
    bool fanAC;
    bool fanAuto;
    bool fanRecirc;
    bool defrostMax;
    bool defrostRear;
    bool defrostFront;

    double maxTemp;
    double minTemp;
    double minFan;
    double maxFan;
    double maxSeatHeat;
    double minSeatHeat;
};

#endif // DBUSHELPER_H

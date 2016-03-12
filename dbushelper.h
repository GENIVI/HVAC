#ifndef DBUSHELPER_H
#define DBUSHELPER_H
#include <QQuickItem>

#ifndef SERVICE_NAME
#define SERVICE_NAME    "com.jaguarlandrover.HVAC"
#endif // SERVICE_NAME

class dbushelper  : public QQuickItem
{
    Q_OBJECT
//    Q_PROPERTY(int temperature READ get_temp WRITE set_temp NOTIFY temp_changed)


public:
    dbushelper();
    void broadcast_temp(QString zone, int newTemp);

signals:
    void temp_leftSeat_changed();
    void temp_rigthSeat_changed();
    void temp_leftSlider_changed();
    void temp_rightSlider_changed();
    void fanSpeed_changed();
    void hazards_changed();
    void fanFeet_changed();
    void fanFace_changed();
    void fanWindscreen_changed();
    void ac_changed();
    void autoMode_changed();
    void recycleMode_changed();
    void heatMax_changed();
    void heatRear_changed();
    void heatFront_changed();



public slots:
    Q_SCRIPTABLE void set_value(QString zone, int newValue);
    Q_SCRIPTABLE void set_mode(QString zone, bool newMode);
    Q_SCRIPTABLE int get_value(QString zone);
    Q_SCRIPTABLE void debug_print(QString myString);


private:
    int temperature_leftSeat;
    int temperature_rightSeat;
    int temperature_leftSlider;
    int temperature_rigthSlider;
    int fanSpeed;
    bool hazards;
    bool fanFeet;
    bool fanFace;
    bool fanWindscreen;
    bool AC;
    bool autoMode;
    bool recycleMode;
    bool heatMax;
    bool heatRear;
    bool heatFront;


};

#endif // DBUSHELPER_H

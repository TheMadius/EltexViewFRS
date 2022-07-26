#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <string>
#include <iostream>
#include <fstream>
#include <QSettings>
#include <QMainWindow>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QHttpMultiPart>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QFile>
#include <QTimer>
#include <QThread>
#include <QRegExp>

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/video.hpp>
#include <opencv2/core/mat.hpp>
#include <vector>

#include "qwidgetrtspstream.h"
#include "enterfacedescriptor.h"
#include "addnewcamera.h"
#include "addfaceinstream.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void replyFinished (QNetworkReply *reply);
    void receiveRequest(QNetworkReply *reply);
    void on_action_triggered();
    void on_action_2_triggered();
    void on_action_3_triggered();

private:
    QString sendServerPostRequest(QString request, std::string data, bool wait = false);
    QString sendServerGetRequest(QString request, bool wait = false);
    void __getSetting(std::string name_jfile);
    void __init_cameras();

    Ui::MainWindow *ui;
    std::vector<QWidgetRTSPStream*> lisr_stream;
    std::vector<dataForAdd> list;
    int count_stream;
    QNetworkAccessManager *manager;
};
#endif // MAINWINDOW_H

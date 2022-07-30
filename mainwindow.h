#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <string>
#include <iostream>
#include <fstream>
#include <QSettings>
#include <QMainWindow>
#include <QListWidgetItem>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QHttpMultiPart>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QFile>
#include <QTimer>
#include <QThread>
#include <QRegExp>
#include <QImage>
#include <QMetaObject>

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
#include "addreleinstream.h"
#include "addrele.h"
#include "hv/WebSocketClient.h"
using namespace hv ;

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
    void updata_pixmap(cv::Mat imange);
    void on_action_triggered();
    void on_action_2_triggered();
    void on_action_3_triggered();
    void on_action_4_triggered();
    void on_action_5_triggered();
    void on_comboBox_activated(int index);

    void on_listStream_itemClicked(QListWidgetItem *item);

    void on_B_Play_stream_clicked();

signals:
    void dataDone(cv::Mat imange);

private:
    QImage cvMatToQImage(const cv::Mat &frame );
    QString sendServerPostRequest(QString request, std::string data, bool wait = false);
    QString sendServerGetRequest(QString request, bool wait = false);
    void __getSetting(std::string name_jfile);
    std::vector<std::string> getListStream();
    std::vector<std::string> getlistRele();
    std::vector<int> getListFace();

    Ui::MainWindow *ui;
    std::vector<QWidgetRTSPStream*> lisr_stream;
    std::vector<dataForAdd> list;
    QGraphicsScene *scene;
    int count_stream;
    QNetworkAccessManager *manager;
    WebSocketClient *ws;
    QMetaObject::Connection connected;
};
#endif // MAINWINDOW_H

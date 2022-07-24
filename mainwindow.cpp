#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "boost/json/src.hpp"

//    QSettings conf;
//    conf.setValue("section1/key1", 123);   // запись в секцию section1
//    conf.setValue("key2", 1421);

template<class T>
void extract( boost::json::object const& obj, T& t, boost::json::string_view key )
{
    t = boost::json::value_to<T>( obj.at( key ) );
}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow) {
    ui->setupUi(this);
    this->manager = new QNetworkAccessManager(this);

    connect(manager, SIGNAL(finished(QNetworkReply *)),
               this, SLOT(replyFinished(QNetworkReply *)));

    this->count_stream = 0;
    __getSetting("cameras.json");
    __init_cameras();
}
void MainWindow::__getSetting(std::string name_jfile) {
    std::ifstream f(name_jfile);
    std::stringstream ss;
    boost::json::value tree;
    ss << f.rdbuf();
    std::string resv_json = ss.str();
    try {
        tree  = boost::json::parse(resv_json);
    } catch (...) {
        qDebug() << "Error: don't parse file!";
        return;
    }
    std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(tree);

    for(auto item: vData) {
        int id;
        std::string str;
        dataForAdd data;

        extract(item, str, "url");
        extract(item, id, "streamId");

        data.index = id;
        data.url_str = str;

        list.push_back(data);
    }
}

void MainWindow::__init_cameras() {
    /*for(auto item: this->list) {
        QWidgetRTSPStream *mystream = new QWidgetRTSPStream(item.url_str, this);
        if(count_stream == 0) {
            this->ui->verticalLayout_5->addWidget(mystream);
        } else {
            this->ui->verticalLayout_4->addWidget(mystream);
        }
        count_stream++;
        this->lisr_stream.push_back(mystream);
    }*/
}
MainWindow::~MainWindow() {
    delete ui;
    delete this->manager;
    for(auto var: lisr_stream) {
        delete var;
    }
}

void MainWindow::sendServerRequest(QString request, std::string data) {
    QNetworkRequest requests;

    requests.setUrl(QUrl(request));
    requests.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("application/json; charset=utf-8"));
    manager->post(requests, data.c_str());
}

void MainWindow::replyFinished (QNetworkReply *reply) {
   if (reply->error() != QNetworkReply::NoError) {
        qDebug() << "ERROR!";
        qDebug() << reply->errorString();
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), reply->errorString());
    }
    reply->deleteLater();
}

void MainWindow::on_action_triggered() {
    addNewCamera *subWin = new addNewCamera(list, this);
    subWin->exec();
    if(subWin->result() == QDialog::Accepted){
        boost::json::array list_stream;
        for(auto item : subWin->list) {
            boost::json::object data;
            data["streamId"] = item.index;
            if (item.isActivate) {
                data["url"] = item.url_str;
                sendServerRequest("http://localhost:9051/api/addStream", boost::json::serialize(data));
            } else {
                sendServerRequest("http://localhost:9051/api/removeStream", boost::json::serialize(data));
                data["url"] = item.url_str;
            }
            list_stream.push_back(data);
        }
        QFile file("cameras.json");
        file.open(QFile::WriteOnly);
        file.write(boost::json::serialize(list_stream).c_str());
    }
}


void MainWindow::on_action_2_triggered()
{
    enterFaceDescriptor *subWin = new enterFaceDescriptor(this);
    subWin->exec();

    if(subWin->result() == QDialog::Accepted){
        boost::json::object data;
        data["streamId"] = subWin->streamId.toStdString();
        data["url"] = ("local:" + subWin->file_name).toStdString();
        data["name"] = subWin->f_name.toStdString();
        data["surname"] = subWin->l_name.toStdString();
        data["lastname"] = subWin->m_name.toStdString();
        sendServerRequest("http://localhost:9051/api/registerFace", boost::json::serialize(data));
    }
    delete subWin;
}

void MainWindow::receiveRequest(QNetworkReply *reply) {
    if (reply->error() != QNetworkReply::NoError) {
         qDebug() << "ERROR!";
         qDebug() << reply->errorString();
     } else {
         QString data = reply->readAll();
         if(data == QString("null")) {
             QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("В базе нет дескрипторов!!!"));
             qDebug() << "ERROR! Empty data";
         } else {

         }
     }
     reply->deleteLater();
}

void MainWindow::on_action_3_triggered() {
    //sendServerRequest("http://localhost:9051/api/listAllFaces", "");
    //sendServerRequest("http://localhost:9051/api/listStreams", "");

    /*std::vector<std::string> streamid;
    std::vector<int> face;

    streamid.push_back("12133");
    streamid.push_back("1223423");
    streamid.push_back("321");

    face.push_back(123);
    face.push_back(1123);
    face.push_back(11233);
    face.push_back(1231);*/

    addFaceInStream *subWin = new addFaceInStream(streamid, face, this);
    subWin->exec();
}


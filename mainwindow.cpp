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

QString MainWindow::sendServerRequest(QString request, std::string data, bool wait) {
    QNetworkRequest requests;
    QNetworkReply *reply;
    QString reply_data;

    requests.setUrl(QUrl(request));
    requests.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("application/json; charset=utf-8"));
    reply = manager->post(requests, data.c_str());

    if (wait) {
        QEventLoop eventLoop;
        auto connect_loop = connect(reply, SIGNAL(finished()), &eventLoop, SLOT(quit()));
        eventLoop.exec();
        reply_data = reply->readAll();
        disconnect(connect_loop);
        return reply_data;
    }
    return reply_data;
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
                sendServerRequest("http://172.16.4.3:9051/api/addStream", boost::json::serialize(data));
            } else {
                sendServerRequest("http://172.16.4.3:9051/api/removeStream", boost::json::serialize(data));
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
        data["url"] = subWin->file_name.toStdString();
        data["name"] = subWin->f_name.toStdString();
        data["surname"] = subWin->l_name.toStdString();
        data["lastname"] = subWin->m_name.toStdString();
        sendServerRequest("http://172.16.4.3:9051/api/registerFace", boost::json::serialize(data));
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
    std::vector<std::string> streamid;
    std::vector<int> face;
    QString listAllFaces;
    QString listStreams;

    listAllFaces = sendServerRequest("http://172.16.4.3:9051/api/listAllFaces", "", true);
    listStreams = sendServerRequest("http://172.16.4.3:9051/api/listStreams", "", true);
    try {
        boost::json::value stream = boost::json::parse(listStreams.toStdString().c_str()).at("data");
        std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(stream);
        for(auto item: vData) {
            streamid.push_back(boost::json::value_to<std::string>(item.at("streamId")));
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
        return;
    }
    try {
        boost::json::value json_fase = boost::json::parse(listAllFaces.toStdString().c_str());
        if(json_fase.kind() != boost::json::kind::null) {
            boost::json::array face_array = json_fase.at("data").as_array();
            for(auto jitem: face_array) {
                face.push_back(boost::json::value_to<int>(jitem));
                break;
            }
            //face = boost::json::value_to<std::vector<int>>(face_data);
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
    }

    addFaceInStream *subWin = new addFaceInStream(streamid, face, this);
    subWin->exec();

    if(subWin->result() == QDialog::Accepted){

        for(auto item : subWin->setting) {
            boost::json::object data;
            boost::json::object data_rm;
            boost::json::array fase_add;
            boost::json::array fase_remove;

            data["streamId"] = item.id;
            data_rm["streamId"] = item.id;

            for(auto data: item.list_fase) {
                if(data.isStream)
                    fase_add.push_back(data.id);
                else
                    fase_remove.push_back(data.id);
            }
            data["faces"] = fase_add;
            data_rm["faces"] = fase_remove;
            sendServerRequest("http://172.16.4.3:9051/api/addFaces", boost::json::serialize(data));
            sendServerRequest("http://172.16.4.3:9051/api/removeFaces", boost::json::serialize(data_rm));
        }
    }
}


#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "boost/json/src.hpp"

template<class T>
void extract( boost::json::object const& obj, T& t, boost::json::string_view key )
{
    t = boost::json::value_to<T>( obj.at( key ) );
}

Q_DECLARE_METATYPE(cv::Mat)

QImage MainWindow::cvMatToQImage(const cv::Mat &frame ) {
    return QImage( (const unsigned char*)(frame.data), frame.cols, frame.rows,static_cast<int>(frame.step), QImage::Format_RGB888).rgbSwapped();
}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow) {
    ui->setupUi(this);
    this->manager = new QNetworkAccessManager(this);
    qRegisterMetaType<cv::Mat>();

    connect(manager, SIGNAL(finished(QNetworkReply *)),
               this, SLOT(replyFinished(QNetworkReply *)));

    this->connected = connect(this, &MainWindow::dataDone,
                                this, &MainWindow::updata_pixmap);

    ws = new WebSocketClient();
    scene = new QGraphicsScene();

    ws->onmessage = [&](const std::string& msg) {
        std::vector<uchar> image(msg.begin(), msg.end());
        auto frame = cv::imdecode(cv::Mat(image), cv::IMREAD_COLOR);

        double dx,dy;
        dx = ui->graphicsStreeam->width() / (double)frame.cols;
        dy = ui->graphicsStreeam->height() / (double)frame.rows;
        cv::resize(frame, frame, cv::Size(), dx, dy, cv::INTER_AREA);
        emit this->dataDone(frame);
    };

    this->ui->list_face->horizontalHeader()->setStretchLastSection( true );

    this->ui->graphicsStreeam->setScene(scene);
    this->ui->graphicsStreeam->setRenderHint(QPainter::Antialiasing);
    this->ui->graphicsStreeam->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    this->ui->graphicsStreeam->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);

    auto listStream = getListStream();
    for (auto var: listStream) {
        this->ui->listStream->addItem(var.c_str());
    }
}

void MainWindow::updata_pixmap(cv::Mat imange)
{
    QImage img_img1 = cvMatToQImage(imange);
    this->scene->addPixmap( QPixmap::fromImage(img_img1) );
    this->scene->update( QRectF(0,0,imange.cols,imange.rows) );
}

void MainWindow::__getSetting(std::string name_jfile) {
    //PASS
}

std::vector<std::string> MainWindow::getListStream() {
    std::vector<std::string> streamid;
    QString listStreams;

    listStreams = sendServerPostRequest("http://localhost:9051/api/listStreams", "", true);

    try {
        boost::json::value stream = boost::json::parse(listStreams.toStdString().c_str());
        if(stream.kind() != boost::json::kind::null)
        {
            stream = stream.at("data");
            std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(stream);
            for(auto item: vData) {
                streamid.push_back(boost::json::value_to<std::string>(item.at("streamId")));
            }
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
        return streamid;
    }
    return streamid;
}

std::vector<int> MainWindow::getListFace() {
    std::vector<int> face;
    QString listAllFaces;

    listAllFaces = sendServerPostRequest("http://localhost:9051/api/listAllFaces", "", true);

    try {
        boost::json::value json_fase = boost::json::parse(listAllFaces.toStdString().c_str());
        if(json_fase.kind() != boost::json::kind::null) {
            boost::json::array face_array = json_fase.at("data").as_array();
            for(auto jitem: face_array) {
                face.push_back(boost::json::value_to<int>(jitem));
                break;
            }
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
    }
    return face;
}

std::vector<std::string> MainWindow::getlistRele()
{
    std::vector<std::string> rele;
    QString listReles;

    listReles = sendServerPostRequest("http://localhost:9051/api/listReles", "", true);

    try {
        boost::json::value json_fase = boost::json::parse(listReles.toStdString().c_str());
        if(json_fase.kind() != boost::json::kind::null) {
            boost::json::value face_array = json_fase.at("data");
            std::vector<boost::json::object> array_obj = boost::json::value_to<std::vector<boost::json::object>>(face_array);
            for(auto item: array_obj) {
                rele.push_back(boost::json::value_to<std::string>( item.at( "name" ) ));
            }
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
    }
    return rele;
}

MainWindow::~MainWindow() {
    disconnect(this->connected);
    delete ui;
    delete this->manager;
    delete this->ws;
    delete this->scene;

    for(auto var: lisr_stream) {
        delete var;
    }
}

QString MainWindow::sendServerGetRequest(QString request, bool wait) {
    QNetworkRequest requests;
    QNetworkReply *reply;
    QString reply_data;

    requests.setUrl(QUrl(request));
    reply = manager->get(requests);

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

QString MainWindow::sendServerPostRequest(QString request, std::string data, bool wait) {
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
                sendServerPostRequest("http://localhost:9051/api/addStream", boost::json::serialize(data));
            } else {
                sendServerPostRequest("http://localhost:9051/api/removeStream", boost::json::serialize(data));
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
        sendServerPostRequest("http://localhost:9051/api/registerFace", boost::json::serialize(data));
    }
    delete subWin;
}

void MainWindow::on_action_3_triggered() {
    std::vector<std::string> streamid;
    QString listStreams;
    std::vector<int> face;
    QString listAllFaces;

    listAllFaces = sendServerPostRequest("http://localhost:9051/api/listAllFaces", "", true);
    listStreams = sendServerPostRequest("http://localhost:9051/api/listStreams", "", true);

    try {
        boost::json::value stream = boost::json::parse(listStreams.toStdString().c_str()).at("data");
        std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(stream);
        for(auto item: vData) {
            streamid.push_back(boost::json::value_to<std::string>(item.at("streamId")));
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
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

    addFaceInStream *subWin = new addFaceInStream({"1","2","3"}, {1,23,4,5,6,8}, this);
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

            sendServerPostRequest("http://localhost:9051/api/addFaces", boost::json::serialize(data));
            sendServerPostRequest("http://localhost:9051/api/removeFaces", boost::json::serialize(data_rm));
        }
    }

    delete subWin;
}

void MainWindow::on_action_4_triggered()
{
    std::ifstream f("query.conf");
    std::stringstream ss;
    boost::json::value tree;
    std::vector<std::string> vData;

    ss << f.rdbuf();
    std::string resv_json = ss.str();

    try {
        tree  = boost::json::parse(resv_json);
        vData = boost::json::value_to<std::vector<std::string>>(tree);
    } catch (...) {
        qDebug() << "Error: don't parse file!";
        return;
    }

    addRele *subWin = new addRele(vData, this);
    subWin->exec();
     if (subWin->result() == QDialog::Accepted) {
          boost::json::object data;
          data["name"] = subWin->name.toStdString();
          data["query"] = subWin->query.toStdString();
          data["feedback"] = subWin->feedback.toStdString();
          sendServerPostRequest("http://localhost:9051/api/addRele", boost::json::serialize(data));
     }
     delete subWin;
}

void MainWindow::on_action_5_triggered()
{
    std::vector<std::string> streamid;
    QString listStreams;
    std::vector<std::string> rele;
    QString listReles;

    listReles = sendServerPostRequest("http://localhost:9051/api/listReles", "", true);
    listStreams = sendServerPostRequest("http://localhost:9051/api/listStreams", "", true);

    try {
        boost::json::value stream = boost::json::parse(listStreams.toStdString().c_str()).at("data");
        std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(stream);
        for(auto item: vData) {
            streamid.push_back(boost::json::value_to<std::string>(item.at("streamId")));
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
    }

    try {
        boost::json::value json_fase = boost::json::parse(listReles.toStdString().c_str());
        if(json_fase.kind() != boost::json::kind::null) {
            boost::json::value face_array = json_fase.at("data");
            std::vector<boost::json::object> array_obj = boost::json::value_to<std::vector<boost::json::object>>(face_array);
            for(auto item: array_obj) {
                rele.push_back(boost::json::value_to<std::string>( item.at( "name" ) ));
            }
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
    }

    addReleInStream *subWin = new addReleInStream(streamid, rele, this);
    subWin->exec();
     if(subWin->result() == QDialog::Accepted){
         for(auto item: subWin->result_rele) {
              boost::json::object data;
              data["streamId"] = item.stream.toStdString();
              data["name"] = item.rele.toStdString();
              sendServerPostRequest("http://localhost:9051/api/connectRele", boost::json::serialize(data));
         }
     }
     delete subWin;
}

void MainWindow::on_comboBox_activated(int index)
{
    if(index != 0){

    } else {

    }
}

void MainWindow::on_listStream_itemClicked(QListWidgetItem *item)
{
    this->ui->lineStreamId->setText(item->text());

    QString listDataStream = sendServerPostRequest("http://localhost:9051/api/listStreams", "", true);
    try {
        boost::json::value stream = boost::json::parse(listDataStream.toStdString().c_str());
        if(stream.kind() != boost::json::kind::null)
        {
            stream = stream.at("data");
            std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(stream);
            for(auto var: vData) {
                auto stream = boost::json::value_to<std::string>(var.at("streamId"));
                if(stream == item->text().toStdString()){
                    std::vector<int> allFace = getListFace();
                    for(auto idFace: allFace) {
                        this->ui->list_face->insertRow(this->ui->list_face->rowCount());
                        this->ui->list_face->setCellWidget( this->ui->list_face->rowCount() - 1, 0, new QCheckBox());
                        this->ui->list_face->setItem(  this->ui->list_face->rowCount() - 1,  1, new QTableWidgetItem(QString::number(idFace)));
                    }
                }
            }
        }
    } catch (...) {
        QMessageBox::critical(NULL, QObject::tr("Ошибка"), QObject::tr("Ошибка преобразования json!!!"));
        qDebug() << "Ошибка преобразования json!!!";
        return;
    }

}


void MainWindow::on_B_Play_stream_clicked()
{
    if (!ws->isConnected()) {
        this->ui->B_Play_stream->setIcon(QIcon(":/qss_icons/dark/rc/checkbox_unchecked.png"));
        QRegExp re( "ws://[\\d\\.\\:]+" );
        QString url;
        QString text;

        text = sendServerGetRequest("http://localhost:9051/api/watchVideo?streamId=" + this->ui->lineStreamId->text(), true);
        re.indexIn(text);
        url = re.cap() + "/" + this->ui->lineStreamId->text();
        ws->open(url.toStdString().c_str());
    } else {
        this->ui->B_Play_stream->setIcon(QIcon(":/qss_icons/dark/rc/arrow_right.png"));
        this->scene->clear();
        ws->send("close");
        ws->close();
    }
}


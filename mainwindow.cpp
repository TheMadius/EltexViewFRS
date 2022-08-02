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
    addMode = false;
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
    qDebug() << listAllFaces;
    try {
        boost::json::value json_fase = boost::json::parse(listAllFaces.toStdString().c_str());
        if(json_fase.kind() != boost::json::kind::null) {
            boost::json::array face_array = json_fase.at("data").as_array();
            int i = 0;
            for(auto jitem: face_array) {
                if(i == 0)
                    face.push_back(boost::json::value_to<int>(jitem));
                i++;
                i %= 4;
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

void MainWindow::on_listStream_itemClicked(QListWidgetItem *item)
{
    if(this->addMode) {
        this->ui->listStream->setCurrentItem(this->ui->listStream->item(0));
    } else {
        std::vector<int> allFace = getListFace();
        addElementInList(allFace, this->ui->list_face);
        this->ui->lineStreamId->setText(item->text());
        this->ui->lineStream_url->setText("");
        QString listDataStream = sendServerPostRequest("http://localhost:9051/api/listStreams", "", true);
        qDebug() << listDataStream;
        try {
            boost::json::value stream = boost::json::parse(listDataStream.toStdString().c_str());
            if (stream.kind() != boost::json::kind::null) {
                stream = stream.at("data");
                std::vector<boost::json::object> vData = boost::json::value_to<std::vector<boost::json::object>>(stream);
                for(auto var: vData) {
                    auto stream = boost::json::value_to<std::string>(var.at("streamId"));
                    if(stream == item->text().toStdString()){
                        std::vector<int> faseInStream;
                        try {faseInStream = boost::json::value_to<std::vector<int>>(var.at("faces"));}catch (...){}
                        for (auto item : faseInStream) {
                            int index = std::find(allFace.begin(), allFace.end(), item) - allFace.begin();
                            if (index >= 0) {
                                ((QCheckBox *)(this->ui->list_face->cellWidget(index, 0)))->setChecked(true);
                            }
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
}

void MainWindow::on_B_Play_stream_clicked()
{
    if (this->addMode) {
        //pass
    } else {
        if (!ws->isConnected()) {
            this->ui->B_Play_stream->setIcon(QIcon(":/qss_icons/dark/rc/checkbox_unchecked.png"));
            QRegExp re( "ws://[\\d\\.\\:]+" );
            QString url, text;

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
}


void MainWindow::on_B_Stream_Del_clicked()
{
    clearPage();
    auto item = this->ui->listStream->currentItem();

    boost::json::object data;
    data["streamId"] = item->text().toStdString();
    sendServerPostRequest("http://localhost:9051/api/removeStream", boost::json::serialize(data));

    this->ui->listStream->removeItemWidget(this->ui->listStream->currentItem());
    this->ui->listStream->setCurrentItem(nullptr);
    delete item;
}

void MainWindow::clearPage()
{
    if (ws->isConnected()) {
        this->ui->B_Play_stream->setIcon(QIcon(":/qss_icons/dark/rc/arrow_right.png"));
        this->scene->clear();
        ws->send("close");
        ws->close();
    }
    this->ui->list_face->setRowCount(0);
    this->ui->lineStreamId->setText("");
    this->ui->lineStream_url->setText("");
}

void MainWindow::on_B_New_stream_clicked()
{
    if (!this->addMode) {
        addMode = true;
        clearPage();

        auto listface = this->getListFace();
        addElementInList(listface, this->ui->list_face);

        this->ui->listStream->insertItem(0, "");
        this->ui->listStream->setCurrentItem(this->ui->listStream->item(0));
    }
}

void MainWindow::on_lineStreamId_editingFinished()
{
    if(this->addMode)
        this->ui->listStream->currentItem()->setText(this->ui->lineStreamId->text());
}

void MainWindow::addElementInList(std::vector<int>& list, QTableWidget *table)
{
    table->setRowCount(0);
    for(auto idFace: list) {
        table->insertRow(this->ui->list_face->rowCount());
        table->setCellWidget( this->ui->list_face->rowCount() - 1, 0, new QCheckBox());
        table->setItem(  this->ui->list_face->rowCount() - 1,  1, new QTableWidgetItem(QString::number(idFace)));
    }
}

void MainWindow::on_B_Accept_clicked()
{
    if (this->addMode) {
        boost::json::object data;
        QString id = this->ui->lineStreamId->text();
        QString url = this->ui->lineStream_url->text();
        if (id.isEmpty() || url.isEmpty()) {
            QMessageBox::critical(NULL,QObject::tr("Ошибка"),tr("Не заполнены все поля!!!"));
        } else {
            data["streamId"] = id.toStdString();
            data["url"] = url.toStdString();
            sendServerPostRequest("http://localhost:9051/api/addStream", boost::json::serialize(data));
            this->addMode = false;
        }
    } else {
        if(this->ui->listStream->currentItem()) {
            boost::json::object data;
            boost::json::object data_rm;
            boost::json::array face;
            boost::json::array face_rm;
            data["streamId"] = this->ui->lineStreamId->text().toStdString();
            data_rm["streamId"] = this->ui->lineStreamId->text().toStdString();
            for(int i = 0; i < this->ui->list_face->rowCount(); i++) {
                if(((QCheckBox *)this->ui->list_face->cellWidget(i, 0))->isChecked()) {
                    face.push_back(ui->list_face->item(i, 1)->text().toInt());
                } else {
                    face_rm.push_back(ui->list_face->item(i, 1)->text().toInt());
                }
            }
            data["faces"] = face;
            data_rm["faces"] = face_rm;
            sendServerPostRequest("http://localhost:9051/api/addFaces", boost::json::serialize(data));
            sendServerPostRequest("http://localhost:9051/api/removeFaces", boost::json::serialize(data_rm));
        }
    }
}

void MainWindow::on_B_Close_clicked()
{
    if (this->addMode) {
        clearPage();
        auto item = this->ui->listStream->currentItem();
        this->ui->listStream->removeItemWidget(this->ui->listStream->currentItem());
        this->ui->listStream->setCurrentItem(nullptr);
        delete item;
        addMode = false;
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

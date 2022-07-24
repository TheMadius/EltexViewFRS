#include "enterrtspstream.h"
#include "ui_enterrtspstream.h"

enterRTSPstream::enterRTSPstream(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::enterRTSPstream)
{
    ui->setupUi(this);
}

enterRTSPstream::~enterRTSPstream()
{
    delete ui;
}

void enterRTSPstream::on_buttonBox_accepted()
{
    QString streamId = this->ui->lineEdit->text();
    QString rtsp = this->ui->lineEdit_2->text();

    if (streamId.isEmpty() || rtsp.isEmpty()) {
        QMessageBox::critical(NULL,QObject::tr("Ошибка"),tr("Не заполнены все поля!!!"));
    } else {
        this->id = streamId;
        this->rtsp = rtsp;
        this->accept();
    }
}


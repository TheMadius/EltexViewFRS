#include "enterfacedescriptor.h"
#include "ui_enterfacedescriptor.h"

enterFaceDescriptor::enterFaceDescriptor(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::enterFaceDescriptor)
{
    ui->setupUi(this);
    this->ui->lineEdit_4->setReadOnly(false);
}

enterFaceDescriptor::~enterFaceDescriptor()
{
    delete ui;
}

void enterFaceDescriptor::on_pushButton_clicked()
{
    QString file_name = QFileDialog::getOpenFileName(this,"Open file",QString(),"JPG (*.jpg)");
    if(!file_name.isNull()) {
       this->ui->lineEdit_4->setText( file_name );
    }
}

void enterFaceDescriptor::on_buttonBox_accepted()
{
    QString streamId = this->ui->lineEdit_5->text();
    QString f_name = this->ui->lineEdit->text();
    QString l_name = this->ui->lineEdit_2->text();
    QString m_name = this->ui->lineEdit_3->text();
    QString file_name = this->ui->lineEdit_4->text();

    if(streamId.isEmpty() || f_name.isEmpty() || l_name.isEmpty() || m_name.isEmpty() || file_name.isEmpty()) {
        QMessageBox::critical(NULL,QObject::tr("Ошибка"),tr("Не заполнены все поля!!!"));
    } else {
        this->streamId = streamId;
        this->f_name = f_name;
        this->l_name = l_name;
        this->m_name = m_name;
        this->file_name = ((this->ui->checkBox->isChecked())?"local:":"") + file_name;
        this->accept();
    }
}


void enterFaceDescriptor::on_checkBox_stateChanged(int arg1)
{
    this->ui->lineEdit_4->setReadOnly((arg1));
    this->ui->lineEdit_4->setText("");
}

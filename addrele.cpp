#include "addrele.h"
#include "ui_addrele.h"

addRele::addRele(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::addRele)
{
    ui->setupUi(this);
}

addRele::~addRele()
{
    delete ui;
}

void addRele::on_buttonBox_accepted()
{
    QString name = this->ui->lineEdit->text();
    QString query = this->ui->lineEdit_2->text();
    QString feedback = this->ui->lineEdit_3->text();

    if(name.isEmpty() | query.isEmpty() | feedback.isEmpty()) {
        QMessageBox::critical(NULL,QObject::tr("Ошибка"),tr("Не заполнены все поля!!!"));
    } else {
        this->name = name;
        this->query = query;
        this->feedback = feedback;
        this->accept();
    }
}


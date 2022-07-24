#include "addfacedescriptor.h"
#include "ui_addfacedescriptor.h"

addFaceDescriptor::addFaceDescriptor(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::addFaceDescriptor)
{
    ui->setupUi(this);
    this->ui->tableWidget->horizontalHeader()->setStretchLastSection( true );
}

addFaceDescriptor::~addFaceDescriptor()
{
    delete ui;
}

void addFaceDescriptor::on_pushButton_clicked()
{
    enterFaceDescriptor *subWin = new enterFaceDescriptor();
    subWin->exec();
    delete subWin;
}


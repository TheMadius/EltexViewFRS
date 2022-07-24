#include "addnewcamera.h"
#include "ui_addnewcamera.h"

addNewCamera::addNewCamera(std::vector<dataForAdd> data, QWidget *parent) :
    QDialog(parent),
    ui(new Ui::addNewCamera)
{
    ui->setupUi(this);
    for(auto item: data) {
        this->ui->tableWidget->insertRow(this->ui->tableWidget->rowCount());
        this->ui->tableWidget->setCellWidget( this->ui->tableWidget->rowCount() - 1, 0, new QCheckBox());
        this->ui->tableWidget->setItem(  this->ui->tableWidget->rowCount() - 1,  1, new QTableWidgetItem(QString::number(item.index)));
        this->ui->tableWidget->setItem(  this->ui->tableWidget->rowCount() - 1,  2, new QTableWidgetItem(item.url_str.c_str()));
    }
    this->ui->tableWidget->horizontalHeader()->setStretchLastSection( true );
}

addNewCamera::~addNewCamera() {
    delete ui;
}

void addNewCamera::on_pushButton_clicked() {
    enterRTSPstream *subWin = new enterRTSPstream(this);
    subWin->exec();

    if(subWin->result() == QDialog::Accepted){
        auto item = new QCheckBox();
        item->setChecked(true);
        this->ui->tableWidget->insertRow(this->ui->tableWidget->rowCount());
        this->ui->tableWidget->setCellWidget( this->ui->tableWidget->rowCount() - 1, 0, item);
        this->ui->tableWidget->setItem(  this->ui->tableWidget->rowCount() - 1,  1, new QTableWidgetItem( subWin->id ));
        this->ui->tableWidget->setItem(  this->ui->tableWidget->rowCount() - 1,  2, new QTableWidgetItem( subWin->rtsp ));
    }
    delete subWin;
}


void addNewCamera::on_pushButton_2_clicked() {
    int row = this->ui->tableWidget->currentRow();
    if(row > -1) {
        this->ui->tableWidget->removeRow(row);
        this->ui->tableWidget->selectionModel()->clearCurrentIndex();
    }
}

void addNewCamera::on_buttonBox_accepted() {
    int countRow = this->ui->tableWidget->rowCount();
    for(int i = 0; i < countRow; ++i) {
        dataForAdd data;
        data.isActivate = ((QCheckBox *)this->ui->tableWidget->cellWidget(i, 0))->isChecked();
        data.index = (this->ui->tableWidget->item(i, 1)->text()).toInt();
        data.url_str = (this->ui->tableWidget->item(i, 2)->text()).toStdString();
        list.push_back(data);
    }
}


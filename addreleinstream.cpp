#include "addreleinstream.h"
#include "ui_addreleinstream.h"

addReleInStream::addReleInStream(std::vector<std::string> sream, std::vector<std::string> rele, QWidget *parent) :
    QDialog(parent),
    ui(new Ui::addReleInStream)
{
    ui->setupUi(this);
    this->ui->tableWidget->horizontalHeader()->setStretchLastSection( true );
    for(auto item : sream) {

        QComboBox *box = new QComboBox();
        for(auto var: rele) {
            box->addItem(var.c_str());
        }

        this->ui->tableWidget->insertRow(this->ui->tableWidget->rowCount());
        this->ui->tableWidget->setItem(this->ui->tableWidget->rowCount() - 1,  0, new QTableWidgetItem(item.c_str()));
        this->ui->tableWidget->setCellWidget( this->ui->tableWidget->rowCount() - 1, 1, box);
    }
}

addReleInStream::~addReleInStream()
{
    delete ui;
}

void addReleInStream::on_buttonBox_accepted()
{
    std::vector<ReleStream> list;

    for(int i = 0; i < this->ui->tableWidget->rowCount(); i++) {
        QString rele;
        QString stream;

        stream = this->ui->tableWidget->item(i, 0)->text();
        rele = ((QComboBox *)(this->ui->tableWidget->cellWidget(i, 1)))->currentText();
        ReleStream data(stream, rele);
        list.push_back(data);
    }
    this->result_rele = list;
    this->accept();
}


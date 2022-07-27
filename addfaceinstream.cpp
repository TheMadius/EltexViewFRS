#include "addfaceinstream.h"
#include "ui_addfaceinstream.h"

addFaceInStream::addFaceInStream(std::vector<std::string> streamId, std::vector<int> face, QWidget *parent):
    QDialog(parent),
    ui(new Ui::addFaceInStream)
{
    ui->setupUi(this);
    oldIntex = 0;
    std::vector<IdFase> list_face;
    for(auto item : face) {
        list_face.push_back(IdFase(item));
    }

    for(auto item: streamId) {
        this->ui->comboBox->addItem(QString::fromStdString(item));
        this->setting.push_back(FaceAndStream(item, list_face));
    }

    this->ui->comboBox->setCurrentIndex(0);
    this->ui->tableWidget->horizontalHeader()->setStretchLastSection( true );
    addTableRowOfIndex(0);
}

addFaceInStream::~addFaceInStream() {
    delete ui;
}


void addFaceInStream::on_comboBox_currentIndexChanged(int index) {
    saveTableRowOfIndex(oldIntex);
    this->ui->checkBox->setChecked(false);
    oldIntex = index;

    for(int i = 0; i < this->ui->tableWidget->rowCount(); i++) {
        ((QCheckBox *)this->ui->tableWidget->cellWidget(i, 0))->setChecked(this->setting[index].list_fase[i].isStream);
    }
}

void addFaceInStream::saveTableRowOfIndex(int index) {
    for(int i = 0; i < this->ui->tableWidget->rowCount(); i++) {
        this->setting[index].list_fase[i].isStream = ((QCheckBox *)this->ui->tableWidget->cellWidget(i, 0))->isChecked();
    }
}

void addFaceInStream::addTableRowOfIndex(int index) {
    this->ui->tableWidget->setRowCount(0);
    if (setting.size() <= index) {
        return;
    }
    for(auto item : this->setting[index].list_fase) {
        auto check = new QCheckBox();
        check->setChecked(item.isStream);
        this->ui->tableWidget->insertRow(this->ui->tableWidget->rowCount());
        this->ui->tableWidget->setCellWidget( this->ui->tableWidget->rowCount() - 1, 0, check);
        this->ui->tableWidget->setItem(  this->ui->tableWidget->rowCount() - 1,  1, new QTableWidgetItem( QString::number(item.id) ));
    }
}

void addFaceInStream::on_buttonBox_accepted() {
    saveTableRowOfIndex(this->ui->comboBox->currentIndex());
    this->accept();
}


void addFaceInStream::on_checkBox_stateChanged(int arg1){
   for(int i = 0; i < this->ui->tableWidget->rowCount(); i++) {
    ((QCheckBox *)this->ui->tableWidget->cellWidget(i, 0))->setChecked(arg1);
   }
}


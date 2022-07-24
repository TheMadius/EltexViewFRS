#ifndef ADDNEWCAMERA_H
#define ADDNEWCAMERA_H

#include <QDialog>
#include <QCheckBox>
#include <string>
#include <iostream>
#include <fstream>
#include "enterrtspstream.h"

namespace Ui {
class addNewCamera;
}

struct dataForAdd
{
   std::string url_str;
   int index;
   bool isActivate;
};

class addNewCamera : public QDialog
{
    Q_OBJECT

public:
    explicit addNewCamera(std::vector<dataForAdd> data, QWidget *parent = nullptr);
    ~addNewCamera();
    std::vector<dataForAdd> list;
private slots:
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();
    void on_buttonBox_accepted();

private:
    Ui::addNewCamera *ui;
};

#endif // ADDNEWCAMERA_H

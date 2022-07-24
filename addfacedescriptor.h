#ifndef ADDFACEDESCRIPTOR_H
#define ADDFACEDESCRIPTOR_H

#include <QDialog>
#include "enterfacedescriptor.h"

namespace Ui {
class addFaceDescriptor;
}

class addFaceDescriptor : public QDialog
{
    Q_OBJECT

public:
    explicit addFaceDescriptor(QWidget *parent = nullptr);
    ~addFaceDescriptor();

private slots:
    void on_pushButton_clicked();

private:
    Ui::addFaceDescriptor *ui;
};

#endif // ADDFACEDESCRIPTOR_H

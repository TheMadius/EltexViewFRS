#ifndef ENTERFACEDESCRIPTOR_H
#define ENTERFACEDESCRIPTOR_H

#include <QDialog>
#include <QFileDialog>
#include <QMessageBox>

namespace Ui {
class enterFaceDescriptor;
}

class enterFaceDescriptor : public QDialog
{
    Q_OBJECT

public:
    explicit enterFaceDescriptor(QWidget *parent = nullptr);
    ~enterFaceDescriptor();
    QString streamId;
    QString f_name;
    QString l_name;
    QString m_name;
    QString file_name;
private slots:
    void on_pushButton_clicked();
    void on_buttonBox_accepted();

private:
    Ui::enterFaceDescriptor *ui;
};

#endif // ENTERFACEDESCRIPTOR_H

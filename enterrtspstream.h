#ifndef ENTERRTSPSTREAM_H
#define ENTERRTSPSTREAM_H

#include <QDialog>
#include <QMessageBox>
#include <QString>

namespace Ui {
class enterRTSPstream;
}

class enterRTSPstream : public QDialog
{
    Q_OBJECT

public:
    explicit enterRTSPstream(QWidget *parent = nullptr);
    ~enterRTSPstream();
    QString id;
    QString rtsp;

private slots:
    void on_buttonBox_accepted();

private:
    Ui::enterRTSPstream *ui;
};

#endif // ENTERRTSPSTREAM_H

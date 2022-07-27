#ifndef ADDRELEINSTREAM_H
#define ADDRELEINSTREAM_H

#include <QDialog>
#include <QString>
#include <vector>
#include <string>
#include <QComboBox>
#include <QDebug>

namespace Ui {
class addReleInStream;
}
struct ReleStream
{
    QString stream;
    QString rele;

    ReleStream(QString stream, QString rele) {
        this->rele = rele;
        this->stream = stream;
    }
};

class addReleInStream : public QDialog
{
    Q_OBJECT

public:
    std::vector<ReleStream> result_rele;
    explicit addReleInStream(std::vector<std::string> sream, std::vector<std::string> rele,QWidget *parent = nullptr);
    ~addReleInStream();

private slots:
    void on_buttonBox_accepted();

private:
    Ui::addReleInStream *ui;
};

#endif // ADDRELEINSTREAM_H

#ifndef ADDFACEINSTREAM_H
#define ADDFACEINSTREAM_H

#include <QDialog>
#include <vector>
#include <QCheckBox>
#include <QDebug>

struct IdFase {
    int id;
    bool isStream;
    IdFase(int id)
    {
        this->id = id;
        isStream = false;
    }
};

struct FaceAndStream {
    std::string id;
    std::vector<IdFase> list_fase;
    FaceAndStream( std::string id, std::vector<IdFase> list_fase){
        this->id = id;
        this->list_fase = list_fase;
    }
};

namespace Ui {
class addFaceInStream;
}

class addFaceInStream : public QDialog
{
    Q_OBJECT

public:
    explicit addFaceInStream(std::vector<std::string> streamId, std::vector<int> face, QWidget *parent = nullptr);
    std::vector<FaceAndStream> setting;
    ~addFaceInStream();

private slots:
    void on_comboBox_currentIndexChanged(int index);
    void on_buttonBox_accepted();

    void on_checkBox_stateChanged(int arg1);

private:
    void addTableRowOfIndex(int index);
    void saveTableRowOfIndex(int index);
    int oldIntex;
    Ui::addFaceInStream *ui;
};

#endif // ADDFACEINSTREAM_H

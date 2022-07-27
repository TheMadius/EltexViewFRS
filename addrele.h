#ifndef ADDRELE_H
#define ADDRELE_H

#include <QDialog>
#include <QMessageBox>
#include <vector>
#include <string>

namespace Ui {
class addRele;
}

class addRele : public QDialog
{
    Q_OBJECT

public:
    QString name;
    QString query;
    QString feedback;
    explicit addRele(std::vector<std::string>list_curl, QWidget *parent = nullptr);
    ~addRele();

private slots:
    void on_buttonBox_accepted();

private:
    Ui::addRele *ui;
};

#endif // ADDRELE_H

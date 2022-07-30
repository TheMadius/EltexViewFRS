#include "mainwindow.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    QFile file(":/qdarkstyle/dark/style.qss");
    file.open(QFile::ReadOnly);

    a.setStyleSheet(file.readAll());
    w.show();
    return a.exec();
}

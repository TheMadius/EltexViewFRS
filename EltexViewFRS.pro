QT       += core gui
QT       += network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

INCLUDEPATH += "/usr/local/include"
INCLUDEPATH += "/usr/local/include/opencv4"
INCLUDEPATH += "./include"

QMAKE_CFLAGS += -Wl,-rpath,"../EltexViewFRS/lib"

LIBS += -L"/usr/local/lib" -lopencv_highgui -lopencv_video -lopencv_videoio -lopencv_imgcodecs -lopencv_imgproc -lopencv_core

LIBS += -L"../EltexViewFRS/lib" -lhv

SOURCES += \
    addfacedescriptor.cpp \
    addfaceinstream.cpp \
    addnewcamera.cpp \
    addrele.cpp \
    addreleinstream.cpp \
    enterfacedescriptor.cpp \
    enterrtspstream.cpp \
    main.cpp \
    mainwindow.cpp \
    qwidgetrtspstream.cpp \
    rtspstreamer.cpp

HEADERS += \
    addfacedescriptor.h \
    addfaceinstream.h \
    addnewcamera.h \
    addrele.h \
    addreleinstream.h \
    enterfacedescriptor.h \
    enterrtspstream.h \
    mainwindow.h \
    qwidgetrtspstream.h \
    rtspstreamer.h

FORMS += \
    addfacedescriptor.ui \
    addfaceinstream.ui \
    addnewcamera.ui \
    addrele.ui \
    addreleinstream.ui \
    enterfacedescriptor.ui \
    enterrtspstream.ui \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    res.qrc

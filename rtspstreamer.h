#ifndef RTSPSTREAMER_H
#define RTSPSTREAMER_H

#include <QObject>
#include <QWidget>
#include <QThread>
#include <QTimer>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/video.hpp>
#include <opencv2/core/mat.hpp>
#include <string>

class RTSPStreamer : public QObject {
    Q_OBJECT
public slots:
    void process();
    void update();
    void stop();
public:
    RTSPStreamer(std::string name_stream);
    ~RTSPStreamer();
signals:
    void finished();
    void stop_timer();
    void matReady(cv::Mat frame);
private:
    cv::VideoCapture *vcam = nullptr;
    std::string *url;
    bool isWork;
};

#endif // RTSPSTREAMER_H

#ifndef QWIDGETRTSPSTREAM_H
#define QWIDGETRTSPSTREAM_H

#include <QWidget>
#include <QLayout>
#include <QGraphicsView>
#include <QGraphicsScene>
#include <string>
#include <QThread>
#include <QTimer>

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/video.hpp>
#include <opencv2/core/mat.hpp>

#include "rtspstreamer.h"

class QWidgetRTSPStream : public QGraphicsView
{
    Q_OBJECT
public:
    explicit QWidgetRTSPStream(std::string url_rtsp, QWidget *parent = nullptr);
    QSize sizeHint() const;
    void resizeEvent(QResizeEvent * event);
    ~QWidgetRTSPStream();
signals:

private slots:
    void videoTimer(cv::Mat frame);
private:
    QImage cvMatToQImage(const cv::Mat &frame );
    void addImageInView(cv::Mat& image, QGraphicsView* view);

    QGraphicsScene *scene;
    RTSPStreamer *stream;
    QThread *thread;
    mutable int lastWidth;
    QTimer *time;
};

#endif // QWIDGETRTSPSTREAM_H

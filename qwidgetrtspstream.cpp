#include "qwidgetrtspstream.h"

QWidgetRTSPStream::QWidgetRTSPStream(std::string url_rtsp, QWidget *parent)
    : QGraphicsView{parent}
{
    this->thread = new QThread();
    this->stream = new RTSPStreamer(url_rtsp);
    this->scene = new QGraphicsScene();

    this->setScene(scene);

    this->setRenderHint(QPainter::Antialiasing);
    this->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    this->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);

    this->time = new QTimer();
    stream->moveToThread(thread);
    connect( time, SIGNAL(timeout()), stream, SLOT(update()));
    connect( thread, &QThread::started, stream, &RTSPStreamer::process);
    connect( stream, &RTSPStreamer::stop_timer, stream, &RTSPStreamer::stop);
    connect( stream, &RTSPStreamer::finished, thread, &QThread::quit);
    connect( stream, &RTSPStreamer::finished, stream, &RTSPStreamer::deleteLater);
    connect( stream, &RTSPStreamer::matReady, this, &QWidgetRTSPStream::videoTimer );
    connect( thread, &QThread::finished, thread, &QThread::deleteLater);
    thread->start();
    this->time->start(1000/60);
}

QWidgetRTSPStream::~QWidgetRTSPStream() {
    this->time->stop();
    delete this->time;
    thread->wait();
    delete this->thread;
    delete this->stream;
    delete this->scene;
}

void QWidgetRTSPStream::videoTimer(cv::Mat frame)
{
    double  dx = this->width() / (double)frame.cols;
    double dy = this->height() / (double)frame.rows;
    cv::resize(frame, frame, cv::Size(), dx, dy, cv::INTER_AREA);
    this->addImageInView(frame, this);
}

QImage QWidgetRTSPStream::cvMatToQImage(const cv::Mat &frame )
{
    return QImage( (const unsigned char*)(frame.data), frame.cols, frame.rows,static_cast<int>(frame.step), QImage::Format_RGB888).rgbSwapped();
}

void QWidgetRTSPStream::addImageInView(cv::Mat& image, QGraphicsView* view)
{
    QImage img_img1 = cvMatToQImage(image);
    view->scene()->addPixmap(QPixmap::fromImage(img_img1));
    view->scene()->update(QRectF(0,0,image.cols,image.rows));
}

QSize QWidgetRTSPStream::sizeHint() const {
    QSize s = size();
    this->lastWidth = s.width();
    s.setWidth(s.width());
    s.setHeight((s.width()*9)/16);
    return s;
}

void QWidgetRTSPStream::resizeEvent(QResizeEvent * event) {
    QGraphicsView::resizeEvent(event);
    if (lastWidth != width()) {
        float w = this->size().width();
        this->resize(w, (w * 9) / 16);
    }
}

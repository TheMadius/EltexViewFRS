#include "rtspstreamer.h"

RTSPStreamer::RTSPStreamer(std::string name_stream) {
    url = new std::string(name_stream);
    isWork = true;
}
RTSPStreamer::~RTSPStreamer() {
    emit this->finished();
    delete this->vcam;
    delete this->url;
}
void RTSPStreamer::stop() {
    isWork = false;
}

void RTSPStreamer::process() {
    vcam  = new cv::VideoCapture(*url);
    emit this->finished();
}

void RTSPStreamer::update() {
    cv::Mat frame;
    (*vcam) >> frame;

    emit this->matReady(frame);
}


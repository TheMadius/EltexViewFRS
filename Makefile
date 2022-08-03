MAKEFILE      = Makefile

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB
CFLAGS        = -pipe -O2 -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -pipe -O2 -std=gnu++1z -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I. -Iinclude -I./include -I./include/opencv4 -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I. -I. -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++
MAKE	      = make
DEL_FILE      = rm -f
LINK          = g++
LFLAGS        = -Wl,-rpath,../EltexViewFRS/lib,-O1
LIBS          = $(SUBLIBS) -L./lib -lopencv_highgui -lopencv_video -lopencv_videoio -lopencv_imgcodecs -lopencv_imgproc -lopencv_core -L./lib -lhv /usr/lib/x86_64-linux-gnu/libQt5Widgets.so /usr/lib/x86_64-linux-gnu/libQt5Gui.so /usr/lib/x86_64-linux-gnu/libQt5Network.so /usr/lib/x86_64-linux-gnu/libQt5Core.so -lGL -lpthread   

SOURCES       = addfacedescriptor.cpp \
		addfaceinstream.cpp \
		addnewcamera.cpp \
		addrele.cpp \
		addreleinstream.cpp \
		enterfacedescriptor.cpp \
		enterrtspstream.cpp \
		main.cpp \
		mainwindow.cpp \
		qwidgetrtspstream.cpp \
		rtspstreamer.cpp qrc_style.cpp \
		moc_addfacedescriptor.cpp \
		moc_addfaceinstream.cpp \
		moc_addnewcamera.cpp \
		moc_addrele.cpp \
		moc_addreleinstream.cpp \
		moc_enterfacedescriptor.cpp \
		moc_enterrtspstream.cpp \
		moc_mainwindow.cpp \
		moc_qwidgetrtspstream.cpp \
		moc_rtspstreamer.cpp
		
OBJECTS       = addfacedescriptor.o \
		addfaceinstream.o \
		addnewcamera.o \
		addrele.o \
		addreleinstream.o \
		enterfacedescriptor.o \
		enterrtspstream.o \
		main.o \
		mainwindow.o \
		qwidgetrtspstream.o \
		rtspstreamer.o \
		qrc_style.o \
		moc_addfacedescriptor.o \
		moc_addfaceinstream.o \
		moc_addnewcamera.o \
		moc_addrele.o \
		moc_addreleinstream.o \
		moc_enterfacedescriptor.o \
		moc_enterrtspstream.o \
		moc_mainwindow.o \
		moc_qwidgetrtspstream.o \
		moc_rtspstreamer.o

TARGET        = EltexViewFRS

first: all

all: EltexViewFRS

build: EltexViewFRS

EltexViewFRS: ui_addfacedescriptor.h ui_addfaceinstream.h ui_addnewcamera.h ui_addrele.h ui_addreleinstream.h ui_enterfacedescriptor.h ui_enterrtspstream.h ui_mainwindow.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

prepare: 
	sudo apt update 
	sudo apt-get --yes install wget git unzip g++ cmake ninja-build qtbase5-dev
	bash ./setup_opencv.sh
	bash ./setup_libhv.sh
	bash ./setup_boost.sh

crossdeploy: EltexViewFRS
	cqtdeployer -bin EltexViewFRS -qmake /usr/bin/qmake -libDir ./lib -recursiveDepth 5 -extraLibs libffi.so.7,libmd4c.so.0,ibmd4c.so.0,libaom.so.3,libatk-1.0.so.0,libavcodec.so.58,libavformat.so.58,libavutil.so.56,libblkid.so.1,libbluray.so.2,libbrotlicommon.so.1,libbrotlidec.so.1,libbsd.so.0,libbz2.so.1.0,libcairo-gobject.so.2,libcairo.so.2,libcap.so.2,libchromaprint.so.1,libcodec2.so.1.0,libcom_err.so.2,libcrypto.so.3,libdatrie.so.1,libdav1d.so.5,libdbus-1.so.3,libdouble-conversion.so.3,libdrm.so.2,libdw.so.1,libEGL.so.1,libelf.so.1,libexpat.so.1,libffi.so.8,libfontconfig.so.1,libfreetype.so.6,libfribidi.so.0,libgcc_s.so.1,libgcrypt.so.20,libgdk_pixbuf-2.0.so.0,libgdk-x11-2.0.so.0,libgio-2.0.so.0,libGLdispatch.so.0,libglib-2.0.so.0,libGL.so.1,libGLX.so.0,libgme.so.0,libgmodule-2.0.so.0,libgmp.so.10,libgnutls.so.30,libgobject-2.0.so.0,libgomp.so.1,libgpg-error.so.0,libgraphite2.so.3,libgsm.so.1,libgssapi_krb5.so.2,libgstapp-1.0.so.0,libgstaudio-1.0.so.0,libgstbase-1.0.so.0,libgstpbutils-1.0.so.0,libgstreamer-1.0.so.0,libgstriff-1.0.so.0,libgsttag-1.0.so.0,libgstvideo-1.0.so.0,libgtk-x11-2.0.so.0,libharfbuzz.so.0,libhogweed.so.6,libhv.so,libICE.so.6,libicudata.so.70,libicui18n.so.70,libicuuc.so.70,libidn2.so.0,libjpeg.so.8,libk5crypto.so.3,libkeyutils.so.1,libkrb5.so.3,libkrb5support.so.0,liblz4.so.1,liblzma.so.5,libmd4c.so.0,libmd.so.0,libmfx.so.1,libmount.so.1,libmp3lame.so.0,libmpg123.so.0,libm.so.6,libnettle.so.8,libnorm.so.1,libnuma.so.1,libogg.so.0,libOpenCL.so.1,libopencv_core.so.405,libopencv_highgui.so.405,libopencv_imgcodecs.so.405,libopencv_imgproc.so.405,libopencv_videoio.so.405,libopenjp2.so.7,libopenmpt.so.0,libopus.so.0,liborc-0.4.so.0,libp11-kit.so.0,libpango-1.0.so.0,libpangocairo-1.0.so.0,libpangoft2-1.0.so.0,libpcre2-16.so.0,libpcre2-8.so.0,libpcre.so.3,libpgm-5.3.so.0,libpixman-1.so.0,libpng16.so.16,libQt5Core.so.5,libQt5DBus.so.5,libQt5Gui.so.5,libQt5Network.so.5,libQt5Widgets.so.5,libQt5XcbQpa.so.5,librabbitmq.so.4,libresolv.so.2,librsvg-2.so.2,libselinux.so.1,libshine.so.3,libSM.so.6,libsnappy.so.1,libsodium.so.23,libsoxr.so.0,libspeex.so.1,libsrt-gnutls.so.1.4,libssh-gcrypt.so.4,libssl.so.3,libstdc++.so.6,libswresample.so.3,libswscale.so.5,libsystemd.so.0,libtasn1.so.6,libthai.so.0,libtheoradec.so.1,libtheoraenc.so.1,libtwolame.so.0,libudfread.so.0,libunistring.so.2,libunwind.so.8,libuuid.so.1,libva-drm.so.2,libva.so.2,libva-x11.so.2,libvdpau.so.1,libvorbisenc.so.2,libvorbisfile.so.3,libvorbis.so.0,libvpx.so.7,libwebpmux.so.3,libwebp.so.7,libX11.so.6,libX11-xcb.so.1,libx264.so.163,libx265.so.199,libXau.so.6,libxcb-icccm.so.4,libxcb-image.so.0,libxcb-keysyms.so.1,libxcb-randr.so.0,libxcb-render.so.0,libxcb-render-util.so.0,libxcb-shape.so.0,libxcb-shm.so.0,libxcb.so.1,libxcb-sync.so.1,libxcb-util.so.1,libxcb-xfixes.so.0,libxcb-xinerama.so.0,libxcb-xinput.so.0,libxcb-xkb.so.1,libXcomposite.so.1,libXcursor.so.1,libXdamage.so.1,libXdmcp.so.6,libXext.so.6,libXfixes.so.3,libXinerama.so.1,libXi.so.6,libxkbcommon.so.0,libxkbcommon-x11.so.0,libxml2.so.2,libXrandr.so.2,libXrender.so.1,libxvidcore.so.4,libzmq.so.5,libz.so.1,libzstd.so.1,libzvbi.so.0,linux-vdso.so.1 qif

clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core

mocclean: compiler_moc_header_clean compiler_moc_objc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_objc_header_make_all compiler_moc_source_make_all

check: first

benchmark: first

compiler_rcc_make_all: qrc_style.cpp
compiler_rcc_clean:
	-$(DEL_FILE) qrc_style.cpp
qrc_style.cpp: dark/style.qrc \
		/usr/lib/qt5/bin/rcc \
		dark/rc/transparent.png \
		dark/rc/line_horizontal_pressed.png \
		dark/rc/line_horizontal.png \
		dark/rc/arrow_left_disabled@2x.png \
		dark/rc/branch_more_focus.png \
		dark/rc/.keep \
		dark/rc/arrow_down_disabled@2x.png \
		dark/rc/toolbar_move_vertical_pressed.png \
		dark/rc/window_close_pressed@2x.png \
		dark/rc/arrow_up_focus.png \
		dark/rc/toolbar_separator_horizontal_pressed@2x.png \
		dark/rc/window_close_pressed.png \
		dark/rc/branch_open_disabled@2x.png \
		dark/rc/line_horizontal_focus@2x.png \
		dark/rc/checkbox_unchecked.png \
		dark/rc/radio_checked_focus@2x.png \
		dark/rc/checkbox_checked_pressed@2x.png \
		dark/rc/base_icon_disabled.png \
		dark/rc/toolbar_move_horizontal.png \
		dark/rc/window_close_disabled.png \
		dark/rc/branch_line@2x.png \
		dark/rc/toolbar_move_vertical@2x.png \
		dark/rc/arrow_right_pressed@2x.png \
		dark/rc/arrow_up_disabled.png \
		dark/rc/checkbox_checked@2x.png \
		dark/rc/toolbar_move_vertical_focus.png \
		dark/rc/radio_unchecked_disabled.png \
		dark/rc/checkbox_indeterminate.png \
		dark/rc/window_close_disabled@2x.png \
		dark/rc/window_grip_pressed@2x.png \
		dark/rc/toolbar_separator_horizontal_focus@2x.png \
		dark/rc/branch_closed_disabled.png \
		dark/rc/branch_line.png \
		dark/rc/checkbox_indeterminate_pressed.png \
		dark/rc/transparent_focus.png \
		dark/rc/toolbar_separator_horizontal.png \
		dark/rc/branch_end_focus.png \
		dark/rc/checkbox_unchecked@2x.png \
		dark/rc/window_undock_disabled.png \
		dark/rc/radio_checked_pressed@2x.png \
		dark/rc/branch_end_focus@2x.png \
		dark/rc/toolbar_move_horizontal_focus.png \
		dark/rc/arrow_left_focus.png \
		dark/rc/arrow_left@2x.png \
		dark/rc/toolbar_separator_vertical_focus@2x.png \
		dark/rc/window_grip_focus@2x.png \
		dark/rc/window_undock_focus.png \
		dark/rc/window_close.png \
		dark/rc/line_horizontal@2x.png \
		dark/rc/toolbar_move_vertical_disabled@2x.png \
		dark/rc/line_vertical_focus@2x.png \
		dark/rc/arrow_right@2x.png \
		dark/rc/base_icon_pressed.png \
		dark/rc/branch_line_focus.png \
		dark/rc/window_grip_focus.png \
		dark/rc/arrow_right_disabled@2x.png \
		dark/rc/branch_more_pressed@2x.png \
		dark/rc/toolbar_move_vertical_disabled.png \
		dark/rc/arrow_up.png \
		dark/rc/arrow_left_pressed@2x.png \
		dark/rc/checkbox_checked.png \
		dark/rc/toolbar_move_horizontal_disabled.png \
		dark/rc/line_vertical_pressed.png \
		dark/rc/base_icon_pressed@2x.png \
		dark/rc/toolbar_separator_vertical_focus.png \
		dark/rc/branch_end_pressed.png \
		dark/rc/checkbox_indeterminate_focus@2x.png \
		dark/rc/window_minimize_disabled.png \
		dark/rc/window_undock_pressed.png \
		dark/rc/radio_checked@2x.png \
		dark/rc/toolbar_move_horizontal_disabled@2x.png \
		dark/rc/branch_closed_disabled@2x.png \
		dark/rc/line_vertical.png \
		dark/rc/branch_line_disabled.png \
		dark/rc/toolbar_separator_vertical.png \
		dark/rc/branch_more_disabled.png \
		dark/rc/toolbar_move_horizontal@2x.png \
		dark/rc/window_undock_disabled@2x.png \
		dark/rc/arrow_down_pressed.png \
		dark/rc/toolbar_separator_horizontal_disabled@2x.png \
		dark/rc/branch_more_disabled@2x.png \
		dark/rc/line_vertical_focus.png \
		dark/rc/toolbar_separator_horizontal@2x.png \
		dark/rc/arrow_left_focus@2x.png \
		dark/rc/transparent_focus@2x.png \
		dark/rc/branch_open_focus@2x.png \
		dark/rc/toolbar_separator_vertical_disabled@2x.png \
		dark/rc/arrow_down_focus@2x.png \
		dark/rc/arrow_up_pressed@2x.png \
		dark/rc/arrow_up_disabled@2x.png \
		dark/rc/checkbox_checked_disabled.png \
		dark/rc/checkbox_checked_disabled@2x.png \
		dark/rc/line_vertical@2x.png \
		dark/rc/window_close@2x.png \
		dark/rc/arrow_right_disabled.png \
		dark/rc/branch_open@2x.png \
		dark/rc/checkbox_unchecked_focus@2x.png \
		dark/rc/line_vertical_disabled@2x.png \
		dark/rc/branch_more.png \
		dark/rc/transparent_pressed@2x.png \
		dark/rc/toolbar_move_vertical.png \
		dark/rc/line_horizontal_focus.png \
		dark/rc/window_minimize_focus.png \
		dark/rc/checkbox_indeterminate@2x.png \
		dark/rc/branch_end_pressed@2x.png \
		dark/rc/arrow_up_pressed.png \
		dark/rc/arrow_right.png \
		dark/rc/radio_checked_disabled@2x.png \
		dark/rc/branch_open_pressed.png \
		dark/rc/line_horizontal_disabled.png \
		dark/rc/window_close_focus.png \
		dark/rc/radio_checked_disabled.png \
		dark/rc/branch_more@2x.png \
		dark/rc/branch_open.png \
		dark/rc/checkbox_unchecked_disabled@2x.png \
		dark/rc/base_icon_focus@2x.png \
		dark/rc/checkbox_unchecked_pressed.png \
		dark/rc/window_close_focus@2x.png \
		dark/rc/window_minimize_pressed@2x.png \
		dark/rc/branch_closed.png \
		dark/rc/arrow_up_focus@2x.png \
		dark/rc/radio_checked_pressed.png \
		dark/rc/branch_end_disabled@2x.png \
		dark/rc/radio_unchecked_disabled@2x.png \
		dark/rc/radio_unchecked_focus@2x.png \
		dark/rc/base_icon@2x.png \
		dark/rc/toolbar_move_vertical_pressed@2x.png \
		dark/rc/toolbar_separator_vertical_pressed.png \
		dark/rc/toolbar_separator_horizontal_disabled.png \
		dark/rc/branch_line_disabled@2x.png \
		dark/rc/branch_closed_pressed.png \
		dark/rc/branch_closed_focus@2x.png \
		dark/rc/window_minimize@2x.png \
		dark/rc/window_minimize.png \
		dark/rc/transparent_pressed.png \
		dark/rc/window_grip@2x.png \
		dark/rc/checkbox_indeterminate_pressed@2x.png \
		dark/rc/base_icon_focus.png \
		dark/rc/checkbox_checked_pressed.png \
		dark/rc/arrow_down_focus.png \
		dark/rc/radio_checked.png \
		dark/rc/branch_end_disabled.png \
		dark/rc/toolbar_move_horizontal_pressed.png \
		dark/rc/radio_unchecked_focus.png \
		dark/rc/window_undock_focus@2x.png \
		dark/rc/radio_unchecked_pressed.png \
		dark/rc/toolbar_separator_vertical_disabled.png \
		dark/rc/window_undock.png \
		dark/rc/window_grip_disabled.png \
		dark/rc/branch_open_pressed@2x.png \
		dark/rc/radio_checked_focus.png \
		dark/rc/checkbox_checked_focus.png \
		dark/rc/window_undock_pressed@2x.png \
		dark/rc/line_vertical_disabled.png \
		dark/rc/checkbox_unchecked_focus.png \
		dark/rc/branch_closed_focus.png \
		dark/rc/arrow_down@2x.png \
		dark/rc/toolbar_move_vertical_focus@2x.png \
		dark/rc/toolbar_separator_horizontal_focus.png \
		dark/rc/window_grip_disabled@2x.png \
		dark/rc/radio_unchecked.png \
		dark/rc/checkbox_unchecked_pressed@2x.png \
		dark/rc/window_grip.png \
		dark/rc/toolbar_separator_vertical@2x.png \
		dark/rc/arrow_right_focus.png \
		dark/rc/toolbar_move_horizontal_focus@2x.png \
		dark/rc/transparent_disabled@2x.png \
		dark/rc/base_icon_disabled@2x.png \
		dark/rc/window_grip_pressed.png \
		dark/rc/base_icon.png \
		dark/rc/transparent@2x.png \
		dark/rc/arrow_up@2x.png \
		dark/rc/line_vertical_pressed@2x.png \
		dark/rc/line_horizontal_disabled@2x.png \
		dark/rc/window_minimize_disabled@2x.png \
		dark/rc/checkbox_indeterminate_disabled.png \
		dark/rc/window_minimize_focus@2x.png \
		dark/rc/window_undock@2x.png \
		dark/rc/checkbox_indeterminate_disabled@2x.png \
		dark/rc/branch_line_pressed@2x.png \
		dark/rc/branch_line_focus@2x.png \
		dark/rc/branch_line_pressed.png \
		dark/rc/window_minimize_pressed.png \
		dark/rc/radio_unchecked@2x.png \
		dark/rc/checkbox_indeterminate_focus.png \
		dark/rc/branch_closed_pressed@2x.png \
		dark/rc/arrow_left.png \
		dark/rc/toolbar_separator_vertical_pressed@2x.png \
		dark/rc/branch_more_focus@2x.png \
		dark/rc/line_horizontal_pressed@2x.png \
		dark/rc/branch_more_pressed.png \
		dark/rc/arrow_right_pressed.png \
		dark/rc/arrow_down_pressed@2x.png \
		dark/rc/toolbar_separator_horizontal_pressed.png \
		dark/rc/branch_closed@2x.png \
		dark/rc/branch_end@2x.png \
		dark/rc/arrow_left_disabled.png \
		dark/rc/transparent_disabled.png \
		dark/rc/branch_open_disabled.png \
		dark/rc/branch_open_focus.png \
		dark/rc/arrow_down_disabled.png \
		dark/rc/radio_unchecked_pressed@2x.png \
		dark/rc/branch_end.png \
		dark/rc/checkbox_unchecked_disabled.png \
		dark/rc/checkbox_checked_focus@2x.png \
		dark/rc/arrow_left_pressed.png \
		dark/rc/arrow_down.png \
		dark/rc/toolbar_move_horizontal_pressed@2x.png \
		dark/rc/arrow_right_focus@2x.png \
		dark/style.qss
	/usr/lib/qt5/bin/rcc -name style dark/style.qrc -o qrc_style.cpp

compiler_moc_predefs_make_all: moc_predefs.h
compiler_moc_predefs_clean:
	-$(DEL_FILE) moc_predefs.h
moc_predefs.h: /usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/data/dummy.cpp
	g++ -pipe -O2 -std=gnu++1z -Wall -Wextra -dM -E -o moc_predefs.h /usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/data/dummy.cpp

compiler_moc_header_make_all: moc_addfacedescriptor.cpp moc_addfaceinstream.cpp moc_addnewcamera.cpp moc_addrele.cpp moc_addreleinstream.cpp moc_enterfacedescriptor.cpp moc_enterrtspstream.cpp moc_mainwindow.cpp moc_qwidgetrtspstream.cpp moc_rtspstreamer.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_addfacedescriptor.cpp moc_addfaceinstream.cpp moc_addnewcamera.cpp moc_addrele.cpp moc_addreleinstream.cpp moc_enterfacedescriptor.cpp moc_enterrtspstream.cpp moc_mainwindow.cpp moc_qwidgetrtspstream.cpp moc_rtspstreamer.cpp
moc_addfacedescriptor.cpp: addfacedescriptor.h \
		enterfacedescriptor.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include addfacedescriptor.h -o moc_addfacedescriptor.cpp

moc_addfaceinstream.cpp: addfaceinstream.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include addfaceinstream.h -o moc_addfaceinstream.cpp

moc_addnewcamera.cpp: addnewcamera.h \
		enterrtspstream.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include addnewcamera.h -o moc_addnewcamera.cpp

moc_addrele.cpp: addrele.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include addrele.h -o moc_addrele.cpp

moc_addreleinstream.cpp: addreleinstream.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include addreleinstream.h -o moc_addreleinstream.cpp

moc_enterfacedescriptor.cpp: enterfacedescriptor.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include enterfacedescriptor.h -o moc_enterfacedescriptor.cpp

moc_enterrtspstream.cpp: enterrtspstream.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include enterrtspstream.h -o moc_enterrtspstream.cpp

moc_mainwindow.cpp: mainwindow.h \
		qwidgetrtspstream.h \
		rtspstreamer.h \
		enterfacedescriptor.h \
		addnewcamera.h \
		enterrtspstream.h \
		addfaceinstream.h \
		addreleinstream.h \
		addrele.h \
		include/hv/WebSocketClient.h \
		include/hv/hexport.h \
		include/hv/TcpClient.h \
		include/hv/hsocket.h \
		include/hv/hplatform.h \
		include/hv/hconfig.h \
		include/hv/hssl.h \
		include/hv/hlog.h \
		include/hv/EventLoopThread.h \
		include/hv/EventLoop.h \
		include/hv/hloop.h \
		include/hv/hdef.h \
		include/hv/hthread.h \
		include/hv/Status.h \
		include/hv/Event.h \
		include/hv/ThreadLocalStorage.h \
		include/hv/Channel.h \
		include/hv/Buffer.h \
		include/hv/hbuf.h \
		include/hv/hbase.h \
		include/hv/WebSocketChannel.h \
		include/hv/wsdef.h \
		include/hv/hmath.h \
		include/hv/HttpParser.h \
		include/hv/HttpMessage.h \
		include/hv/hstring.h \
		include/hv/hmap.h \
		include/hv/hfile.h \
		include/hv/hpath.h \
		include/hv/httpdef.h \
		include/hv/http_content.h \
		include/hv/json.hpp \
		include/hv/WebSocketParser.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include mainwindow.h -o moc_mainwindow.cpp

moc_qwidgetrtspstream.cpp: qwidgetrtspstream.h \
		rtspstreamer.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include qwidgetrtspstream.h -o moc_qwidgetrtspstream.cpp

moc_rtspstreamer.cpp: rtspstreamer.h \
		moc_predefs.h \
		/usr/lib/qt5/bin/moc
	/usr/lib/qt5/bin/moc $(DEFINES) --include /home/nadius/EltexViewFRS/moc_predefs.h -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++ -I/home/nadius/EltexViewFRS -I/usr/local/include/opencv4 -I/home/nadius/EltexViewFRS/include -I/home/nadius/EltexViewFRS/src/include -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/c++/11/backward -I/usr/lib/gcc/x86_64-linux-gnu/11/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include rtspstreamer.h -o moc_rtspstreamer.cpp

compiler_moc_objc_header_make_all:
compiler_moc_objc_header_clean:
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_addfacedescriptor.h ui_addfaceinstream.h ui_addnewcamera.h ui_addrele.h ui_addreleinstream.h ui_enterfacedescriptor.h ui_enterrtspstream.h ui_mainwindow.h
compiler_uic_clean:
	-$(DEL_FILE) ui_addfacedescriptor.h ui_addfaceinstream.h ui_addnewcamera.h ui_addrele.h ui_addreleinstream.h ui_enterfacedescriptor.h ui_enterrtspstream.h ui_mainwindow.h
ui_addfacedescriptor.h: addfacedescriptor.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic addfacedescriptor.ui -o ui_addfacedescriptor.h

ui_addfaceinstream.h: addfaceinstream.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic addfaceinstream.ui -o ui_addfaceinstream.h

ui_addnewcamera.h: addnewcamera.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic addnewcamera.ui -o ui_addnewcamera.h

ui_addrele.h: addrele.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic addrele.ui -o ui_addrele.h

ui_addreleinstream.h: addreleinstream.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic addreleinstream.ui -o ui_addreleinstream.h

ui_enterfacedescriptor.h: enterfacedescriptor.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic enterfacedescriptor.ui -o ui_enterfacedescriptor.h

ui_enterrtspstream.h: enterrtspstream.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic enterrtspstream.ui -o ui_enterrtspstream.h

ui_mainwindow.h: mainwindow.ui \
		/usr/lib/qt5/bin/uic
	/usr/lib/qt5/bin/uic mainwindow.ui -o ui_mainwindow.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_rcc_clean compiler_moc_predefs_clean compiler_moc_header_clean compiler_uic_clean 

####### Compile

addfacedescriptor.o: addfacedescriptor.cpp addfacedescriptor.h \
		enterfacedescriptor.h \
		ui_addfacedescriptor.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o addfacedescriptor.o addfacedescriptor.cpp

addfaceinstream.o: addfaceinstream.cpp addfaceinstream.h \
		ui_addfaceinstream.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o addfaceinstream.o addfaceinstream.cpp

addnewcamera.o: addnewcamera.cpp addnewcamera.h \
		enterrtspstream.h \
		ui_addnewcamera.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o addnewcamera.o addnewcamera.cpp

addrele.o: addrele.cpp addrele.h \
		ui_addrele.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o addrele.o addrele.cpp

addreleinstream.o: addreleinstream.cpp addreleinstream.h \
		ui_addreleinstream.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o addreleinstream.o addreleinstream.cpp

enterfacedescriptor.o: enterfacedescriptor.cpp enterfacedescriptor.h \
		ui_enterfacedescriptor.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o enterfacedescriptor.o enterfacedescriptor.cpp

enterrtspstream.o: enterrtspstream.cpp enterrtspstream.h \
		ui_enterrtspstream.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o enterrtspstream.o enterrtspstream.cpp

main.o: main.cpp mainwindow.h \
		qwidgetrtspstream.h \
		rtspstreamer.h \
		enterfacedescriptor.h \
		addnewcamera.h \
		enterrtspstream.h \
		addfaceinstream.h \
		addreleinstream.h \
		addrele.h \
		include/hv/WebSocketClient.h \
		include/hv/hexport.h \
		include/hv/TcpClient.h \
		include/hv/hsocket.h \
		include/hv/hplatform.h \
		include/hv/hconfig.h \
		include/hv/hssl.h \
		include/hv/hlog.h \
		include/hv/EventLoopThread.h \
		include/hv/EventLoop.h \
		include/hv/hloop.h \
		include/hv/hdef.h \
		include/hv/hthread.h \
		include/hv/Status.h \
		include/hv/Event.h \
		include/hv/ThreadLocalStorage.h \
		include/hv/Channel.h \
		include/hv/Buffer.h \
		include/hv/hbuf.h \
		include/hv/hbase.h \
		include/hv/WebSocketChannel.h \
		include/hv/wsdef.h \
		include/hv/hmath.h \
		include/hv/HttpParser.h \
		include/hv/HttpMessage.h \
		include/hv/hstring.h \
		include/hv/hmap.h \
		include/hv/hfile.h \
		include/hv/hpath.h \
		include/hv/httpdef.h \
		include/hv/http_content.h \
		include/hv/json.hpp \
		include/hv/WebSocketParser.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

mainwindow.o: mainwindow.cpp mainwindow.h \
		qwidgetrtspstream.h \
		rtspstreamer.h \
		enterfacedescriptor.h \
		addnewcamera.h \
		enterrtspstream.h \
		addfaceinstream.h \
		addreleinstream.h \
		addrele.h \
		include/hv/WebSocketClient.h \
		include/hv/hexport.h \
		include/hv/TcpClient.h \
		include/hv/hsocket.h \
		include/hv/hplatform.h \
		include/hv/hconfig.h \
		include/hv/hssl.h \
		include/hv/hlog.h \
		include/hv/EventLoopThread.h \
		include/hv/EventLoop.h \
		include/hv/hloop.h \
		include/hv/hdef.h \
		include/hv/hthread.h \
		include/hv/Status.h \
		include/hv/Event.h \
		include/hv/ThreadLocalStorage.h \
		include/hv/Channel.h \
		include/hv/Buffer.h \
		include/hv/hbuf.h \
		include/hv/hbase.h \
		include/hv/WebSocketChannel.h \
		include/hv/wsdef.h \
		include/hv/hmath.h \
		include/hv/HttpParser.h \
		include/hv/HttpMessage.h \
		include/hv/hstring.h \
		include/hv/hmap.h \
		include/hv/hfile.h \
		include/hv/hpath.h \
		include/hv/httpdef.h \
		include/hv/http_content.h \
		include/hv/json.hpp \
		include/hv/WebSocketParser.h \
		ui_mainwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o mainwindow.o mainwindow.cpp

qwidgetrtspstream.o: qwidgetrtspstream.cpp qwidgetrtspstream.h \
		rtspstreamer.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qwidgetrtspstream.o qwidgetrtspstream.cpp

rtspstreamer.o: rtspstreamer.cpp rtspstreamer.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o rtspstreamer.o rtspstreamer.cpp

qrc_style.o: qrc_style.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qrc_style.o qrc_style.cpp

moc_addfacedescriptor.o: moc_addfacedescriptor.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_addfacedescriptor.o moc_addfacedescriptor.cpp

moc_addfaceinstream.o: moc_addfaceinstream.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_addfaceinstream.o moc_addfaceinstream.cpp

moc_addnewcamera.o: moc_addnewcamera.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_addnewcamera.o moc_addnewcamera.cpp

moc_addrele.o: moc_addrele.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_addrele.o moc_addrele.cpp

moc_addreleinstream.o: moc_addreleinstream.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_addreleinstream.o moc_addreleinstream.cpp

moc_enterfacedescriptor.o: moc_enterfacedescriptor.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_enterfacedescriptor.o moc_enterfacedescriptor.cpp

moc_enterrtspstream.o: moc_enterrtspstream.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_enterrtspstream.o moc_enterrtspstream.cpp

moc_mainwindow.o: moc_mainwindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_mainwindow.o moc_mainwindow.cpp

moc_qwidgetrtspstream.o: moc_qwidgetrtspstream.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_qwidgetrtspstream.o moc_qwidgetrtspstream.cpp

moc_rtspstreamer.o: moc_rtspstreamer.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_rtspstreamer.o moc_rtspstreamer.cpp

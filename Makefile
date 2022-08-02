MAKEFILE      = Makefile

EQ            = =


CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB
CFLAGS        = -pipe -O2 -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -pipe -O2 -std=gnu++1z -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I. -Iinclude -I./include -I./include/opencv4 -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5/QtNetwork -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I. -I. -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++
QMAKE         = /usr/lib/qt5/bin/qmake
MAKE		  = make
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
QINSTALL      = /usr/lib/qt5/bin/qmake -install qinstall
QINSTALL_PROGRAM = /usr/lib/qt5/bin/qmake -install qinstall -exe
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = EltexViewFRS1.0.0
DISTDIR = /home/nadius/EltexViewFRS/.tmp/EltexViewFRS1.0.0
LINK          = g++
LFLAGS        = -Wl,-rpath,../EltexViewFRS/lib,-O1
LIBS          = $(SUBLIBS) -L./lib -lopencv_highgui -lopencv_video -lopencv_videoio -lopencv_imgcodecs -lopencv_imgproc -lopencv_core -L./lib -lhv /usr/lib/x86_64-linux-gnu/libQt5Widgets.so /usr/lib/x86_64-linux-gnu/libQt5Gui.so /usr/lib/x86_64-linux-gnu/libQt5Network.so /usr/lib/x86_64-linux-gnu/libQt5Core.so -lGL -lpthread   
AR            = ar cqs
RANLIB        = 
SED           = sed
STRIP         = strip

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
DIST          = /usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/sanitize.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_accessibility_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_devicediscovery_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_edid_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_egl_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_eventdispatcher_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_fb_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_fontdatabase_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_glx_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_input_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_kms_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_linuxaccessibility_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_platformcompositor_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_service_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_theme_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_vulkan_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xkbcommon_support_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/toolchain.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resources_functions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qmake_use.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/file_copies.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/lex.prf \
		EltexViewFRS.pro addfacedescriptor.h \
		addfaceinstream.h \
		addnewcamera.h \
		addrele.h \
		addreleinstream.h \
		enterfacedescriptor.h \
		enterrtspstream.h \
		mainwindow.h \
		qwidgetrtspstream.h \
		rtspstreamer.h addfacedescriptor.cpp \
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
QMAKE_TARGET  = EltexViewFRS
TARGET        = EltexViewFRS

first: all

EltexViewFRS: ui_addfacedescriptor.h ui_addfaceinstream.h ui_addnewcamera.h ui_addrele.h ui_addreleinstream.h ui_enterfacedescriptor.h ui_enterrtspstream.h ui_mainwindow.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

all: EltexViewFRS

build: EltexViewFRS

prepare: 
	sudo apt update 
	sudo apt-get --yes install wget git unzip g++ cmake ninja-build qtbase5-dev
	bash ./setup_opencv.sh
	bash ./setup_libhv.sh
	bash ./setup_boost.sh

clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


distclean: clean 
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) .qmake.stash
	-$(DEL_FILE) Makefile

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

load(qt_build_config)

INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

TARGET = QtZXing

MODULE = zxing

load(qt_module)

CONFIG += exceptions c++11
CONFIG += qzxing_qml qzxing_multimedia

TEMP_INSTALLS = $$INSTALLS
TARGET_PATH = $$target.path
include(../../qzxing/src/QZXing.pri)
target.path = $$TARGET_PATH
INSTALLS = $$TEMP_INSTALLS

DEFINES -= DISABLE_LIBRARY_FEATURES

!contains(CONFIG, no_install) {
    QZXING_HEADERS = $$files($$PWD/../../qzxing/src/*.h)
    ZXING_HEADERS = $$files($$PWD/../../qzxing/src/zxing/*.h, true) $$files($$PWD/../../qzxing/src/zxing/*.hh, true)

    INSTALL_HEADERS_PREFIX = $$[QT_INSTALL_HEADERS]
    INSTALL_PREFIX = $$INSTALL_HEADERS_PREFIX/QtZXing
    INSTALL_HEADERS = $$QZXING_HEADERS
    INSTALL_BASEPATH = $${dirname(PWD)}/../qzxing/src
    include(qmake/headerinstall.pri)

    INSTALL_HEADERS_PREFIX = $$[QT_INSTALL_HEADERS]
    INSTALL_PREFIX = $$INSTALL_HEADERS_PREFIX/QtZXing
    INSTALL_HEADERS = $$ZXING_HEADERS
    INSTALL_BASEPATH = $${dirname(PWD)}/../qzxing/src/zxing
    include(qmake/headerinstall.pri)
}

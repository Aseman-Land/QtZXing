load(qt_build_config)

INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

TARGET = QtZXing

MODULE = zxing
MODULE_PRI = ../../modules/qt_zxing.pri

load(qt_module)

CONFIG += exceptions c++11
CONFIG += qzxing_qml qzxing_multimedia

include(../../qzxing/src/QZXing.pri)
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

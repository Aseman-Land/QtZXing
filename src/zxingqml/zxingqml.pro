TARGET  = qzxingqml
TARGETPATH = QZXing
IMPORT_VERSION = 2.3
VERSION_REVISION = 2

INCLUDEPATH += $$PWD $$PWD/../../qzxing/src/ $$PWD/../../qzxing/src/zxing
QT += core gui zxing multimedia qml quick
CONFIG += c++11
DEFINES += QZXING_QML

HEADERS += \
    $$PWD/qzxingqmlplugin.h

SOURCES += \
    $$PWD/qzxingqmlplugin.cpp

static: !linux: DEFINES += ASEMAN_STATIC_BUILD

INCLUDED_RESOURCE_FILES += \
    plugins.qmltypes
    qmldir

asemanqml.files = $$INCLUDED_RESOURCE_FILES
asemanqml.prefix = /AsemanQml/
RESOURCES += asemanqml

load(qml_plugin)

#include "qzxingqmlplugin.h"

#include <QDebug>
#include <QDir>
#include <QStringList>
#include <QtQml>

#include <QZXing.h>

#ifdef ASEMAN_STATIC_BUILD
bool QZXingQmlPlugin::static_types_registered = QZXingQmlPlugin::registerStaticTypes("QZXing");
#endif

bool QZXingQmlPlugin::registerStaticTypes(const char *)
{
#ifdef ASEMAN_STATIC_BUILD
    if(static_types_registered)
        return true;
#endif
    QZXing::registerQMLTypes();
    return true;
}

void QZXingQmlPlugin::registerTypes(const char *)
{
    QZXing::registerQMLTypes();
}

void QZXingQmlPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}

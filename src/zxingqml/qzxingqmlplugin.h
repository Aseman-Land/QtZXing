#ifndef QZXINGQMLPLUGIN_H
#define QZXINGQMLPLUGIN_H

#include <QQmlExtensionPlugin>

class QZXingQmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    static bool registerStaticTypes(const char *uri);

    void registerTypes(const char *uri);
    void initializeEngine(QQmlEngine *engine, const char *uri);

private:
#ifdef QZXING_STATIC_BUILD
    static bool static_types_registered;
#endif
};

#endif // QZXINGQMLPLUGIN_H

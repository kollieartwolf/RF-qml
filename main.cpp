#include "kernel.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtSvg>

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
  QGuiApplication app(argc, argv);
  qmlRegisterType<Kernel>("edu.russia.forum.kernel", 1, 0, "Kernel");
  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/starter.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);
  return app.exec();
}

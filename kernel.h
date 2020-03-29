#ifndef KERNEL_H
#define KERNEL_H

#include <QDebug>
#include <QObject>
#include <QSettings>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDateTime>

#include "fetcher.h"

class Kernel : public QObject {
  Q_OBJECT
  Q_PROPERTY(bool signedIn READ signedIn WRITE setSignedIn)
  Q_PROPERTY(QString dates READ dates WRITE setDates)
  Q_PROPERTY(bool initLoaded READ initLoaded WRITE setInitLoaded NOTIFY initLoadedChanged)
 public:
  explicit Kernel(QObject *parent = nullptr);

  bool signedIn() { return m_signedIn; }
  bool initLoaded() { return m_initLoaded; }
  QString dates() { return m_dates; }
  void setSignedIn(const bool &signedIn);
  void setLogin(const QString &login);
  void setPass(const QString &pass);
  void setInitLoaded(const bool &initLoaded);
  void setDates(const QString &dates);
  void checkServer(QNetworkReply *pData);
  void setInitData(QNetworkReply *pData);
  Q_INVOKABLE QString getString(const QString &key);

 signals:
  void loginChanged();
  void passChanged();
  void initLoadedChanged();

 private:
  bool m_signedIn = false;
  bool m_initLoaded = false;
  QString m_dates = "";
  QString m_login = "";
  QString m_pass = "";
  Fetcher *m_fetcher;
  QSettings *m_settings;
  QJsonDocument m_keyValues;
};

#endif  // KERNEL_H

#ifndef KERNEL_H
#define KERNEL_H

#include <QCryptographicHash>
#include <QDateTime>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>
#include <QSettings>

#include "fetcher.h"
#include "radioplayer.h"

class Kernel : public QObject {
  Q_OBJECT
  Q_PROPERTY(
      bool signedIn READ signedIn WRITE setSignedIn NOTIFY signedInChanged)
  Q_PROPERTY(bool signInError READ signInError WRITE setSignInError NOTIFY
                 signInErrorChanged)
  Q_PROPERTY(QString dates READ dates WRITE setDates)
  Q_PROPERTY(bool initLoaded READ initLoaded WRITE setInitLoaded NOTIFY
                 initLoadedChanged)
  Q_PROPERTY(QString login READ login WRITE setLogin)
  Q_PROPERTY(QString pass READ pass WRITE setPass)
  Q_PROPERTY(bool radioState READ radioState WRITE setRadioState)
public:
  explicit Kernel(QObject *parent = nullptr);

  QString login() { return m_login; }
  QString pass() { return m_pass; }
  bool radioState() { return m_radioState; }
  bool signedIn() { return m_signedIn; }
  bool signInError() { return m_signInError; }
  bool initLoaded() { return m_initLoaded; }
  QString dates() { return m_dates; }
  void setSignedIn(const bool &signedIn);
  void setSignInError(const bool &signInError);
  void setLogin(const QString &login);
  void setPass(const QString &pass);
  void setRadioState(const bool &radioState);
  void setInitLoaded(const bool &initLoaded);
  void setDates(const QString &dates);
  void checkServer(QNetworkReply *pData);
  void setInitData(QNetworkReply *pData);
  Q_INVOKABLE QString getString(const QString &key);
  Q_INVOKABLE QString getProfileData(const QString &key);
  Q_INVOKABLE void sign();

  void fetchProfile(QNetworkReply *pData);

signals:
  void loginChanged();
  void passChanged();
  void initLoadedChanged();
  void signedInChanged();
  void signInErrorChanged();

private:
  bool m_signedIn = false;
  bool m_signInError = false;
  bool m_initLoaded = false;
  bool m_radioState = false;
  QString m_dates = "";
  QString m_login = "";
  QString m_pass = "";
  Fetcher *m_fetcher;
  RadioPlayer *m_radioplayer;
  QSettings *m_settings;
  QJsonDocument m_keyValues;
  QJsonDocument m_profile;
};

#endif // KERNEL_H

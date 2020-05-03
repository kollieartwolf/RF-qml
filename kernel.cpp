#include "kernel.h"
#include <QDebug>

Kernel::Kernel(QObject *parent) : QObject(parent) {
  // При запуске
  m_settings = new QSettings("RM", "RF-qml", this);
  m_radioplayer = new RadioPlayer(this);
  m_fetcher = new Fetcher(this);
  connect(m_fetcher, &Fetcher::finished, this, &Kernel::checkServer);
  m_fetcher->fetch("https://markcda.pythonanywhere.com/reloadAll");
}

void Kernel::setSignedIn(const bool &signedIn) {
  if (signedIn == m_signedIn)
    return;
  m_signedIn = signedIn;
  emit signedInChanged();
}

void Kernel::setSignInError(const bool &signInError) {
  if (signInError == m_signInError)
    return;
  m_signInError = signInError;
  emit signInErrorChanged();
}

void Kernel::setLogin(const QString &login) {
  if (login == m_login)
    return;
  m_login = login;
}

void Kernel::setPass(const QString &pass) {
  if (pass == m_pass)
    return;
  m_pass = pass;
}

void Kernel::setRadioState(const bool &radioState) {
  if (radioState == m_radioState)
    return;
  m_radioState = radioState;
  m_radioplayer->setEnabled(m_radioState);
}

void Kernel::setInitLoaded(const bool &initLoaded) {
  if (initLoaded == m_initLoaded)
    return;
  m_initLoaded = initLoaded;
  emit initLoadedChanged();
}

void Kernel::setDates(const QString &dates) {
  if (dates == m_dates)
    return;
  m_dates = dates;
}

void Kernel::checkServer(QNetworkReply *pData) {
  disconnect(m_fetcher, &Fetcher::finished, this, &Kernel::checkServer);
  qlonglong secs = pData->readAll().toLongLong();
  if ((m_settings->value("isNotFirstOpen").toInt() != 1) ||
      (m_settings->value("secs").toLongLong() < secs)) {
    // Первый запуск/перезагрузка данных с сервера: синхронизация.
    connect(m_fetcher, &Fetcher::finished, this, &Kernel::setInitData);
    m_fetcher->fetch("https://markcda.pythonanywhere.com/getInitValues");
    m_settings->setValue("secs", secs);
  } else {
    // Считывание основных строк.
    m_keyValues = QJsonDocument::fromBinaryData(
        m_settings->value("initValues").toByteArray());
    setInitLoaded(true);
  }
  // Считывание данных профиля.
  if (m_settings->value("loggedIn").toBool()) {
    m_profile =
        QJsonDocument::fromJson(m_settings->value("profileData").toByteArray());
    m_signedIn = m_settings->value("loggedIn").toBool();
  }
  // Запрос первых 10 новостей и 10 спикеров.
}

void Kernel::setInitData(QNetworkReply *pData) {
  disconnect(m_fetcher, &Fetcher::finished, this, &Kernel::setInitData);
  m_keyValues = QJsonDocument::fromJson(pData->readAll());
  m_settings->setValue("isNotFirstOpen", 1);
  m_settings->setValue("initValues", m_keyValues.toBinaryData());
  setDates(m_keyValues.object().value("dates").toString());
  setInitLoaded(true);
}

QString Kernel::getString(const QString &key) {
  return m_keyValues.object().value(key).toString();
}

QString Kernel::getProfileData(const QString &key) {
  return m_profile.object().value(key).toString();
}

void Kernel::sign() {
  connect(m_fetcher, &Fetcher::finished, this, &Kernel::fetchProfile);
  QByteArray hash =
      QCryptographicHash::hash(m_pass.toUtf8(), QCryptographicHash::Sha3_256);
  QNetworkRequest request(QUrl("https://markcda.pythonanywhere.com/login"));
  request.setRawHeader("Host", "markcda.pythonanywhere.com");
  request.setRawHeader("Origin", "https://markcda.pythonanywhere.com");
  QHttpMultiPart *mpart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
  QHttpPart namePart;
  namePart.setHeader(QNetworkRequest::ContentDispositionHeader,
                     "form-data; name=\"name\"");
  namePart.setBody(m_login.toUtf8());
  QHttpPart hashPart;
  hashPart.setHeader(QNetworkRequest::ContentDispositionHeader,
                     "form-data; name=\"hash\"");
  hashPart.setBody(QString::fromLocal8Bit(hash.toHex()).toUtf8());
  mpart->append(namePart);
  mpart->append(hashPart);
  m_fetcher->post(request, mpart);
}

void Kernel::fetchProfile(QNetworkReply *pData) {
  disconnect(m_fetcher, &Fetcher::finished, this, &Kernel::fetchProfile);
  QByteArray qba = pData->readAll();
  m_profile = QJsonDocument::fromJson(qba);
  if (m_profile.isEmpty()) {
    setSignInError(true);
    setSignedIn(false);
    return;
  }
  m_settings->setValue("profileData", m_profile.toJson());
  m_settings->setValue("loggedIn", true);
  setSignInError(false);
  setSignedIn(true);
}

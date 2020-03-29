#include "kernel.h"

Kernel::Kernel(QObject *parent) : QObject(parent) {
  // При запуске
  m_settings = new QSettings("RM", "RF-qml", this);
  m_fetcher = new Fetcher(this);
  connect(m_fetcher, &Fetcher::finished, this, &Kernel::checkServer);
  m_fetcher->fetch("http://markcda.pythonanywhere.com/reloadAll");
}

void Kernel::setSignedIn(const bool &signedIn) {
  if (signedIn == m_signedIn) return;
  m_signedIn = signedIn;
}

void Kernel::setLogin(const QString &login) {
  if (login == m_login) return;
  m_login = login;
}

void Kernel::setPass(const QString &pass) {
  if (pass == m_pass) return;
  m_pass = pass;
}

void Kernel::setInitLoaded(const bool &initLoaded) {
  if (initLoaded == m_initLoaded) return;
  m_initLoaded = initLoaded;
  emit initLoadedChanged();
}

void Kernel::setDates(const QString &dates) {
  if (dates == m_dates) return;
  m_dates = dates;
}

void Kernel::checkServer(QNetworkReply *pData) {
  disconnect(m_fetcher, &Fetcher::finished, this, &Kernel::checkServer);
  if ((m_settings->value("isNotFirstOpen").toInt() != 1) ||
      (QDateTime::currentSecsSinceEpoch() <= pData->readAll().toInt())) {
    // Первый запуск/перезагрузка данных с сервера: синхронизация.
    connect(m_fetcher, &Fetcher::finished, this, &Kernel::setInitData);
    m_fetcher->fetch("http://markcda.pythonanywhere.com/getInitValues");
    m_settings->setValue("loggedIn", false);
  } else {
    // Считывание данных профиля.
    if (m_settings->value("loggedIn").toBool()) {
    }
    // Считывание основных строк.
    m_keyValues = QJsonDocument::fromBinaryData(
        m_settings->value("initValues").toByteArray());
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

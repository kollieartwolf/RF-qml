#include "kernel.h"

Kernel::Kernel(QObject *parent) : QObject(parent) {
  db.setDatabaseName("test.db");
  db.open();
}

Kernel::~Kernel() { db.close(); }

void Kernel::setSignedIn(const bool &signedIn) {
  if (signedIn == m_signedIn)
    return;
  m_signedIn = signedIn;
  if (m_signedIn == true)
    connectValues();
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

void Kernel::setWhichSocial(const int &whichSocial) {
  if (whichSocial == m_whichSocial)
    return;
  m_whichSocial = whichSocial;
}

void Kernel::connectValues() {
  auto *query = new QSqlQuery(db);
  query->exec(QString("SELECT * FROM users WHERE login=\"%1\" AND pass=\"%2\"")
                  .arg(m_login)
                  .arg(m_pass));
  qDebug() << query->lastError();
  query->first();
  if (query->isValid()) {
    m_id = query->value(0).toInt();
    m_name = query->value(3).toString();
    m_type = query->value(4).toString();
    m_age = query->value(5).toInt();
    m_worksWith = query->value(6).toString();
    m_city = query->value(7).toString();
    m_uni = query->value(8).toString();
    emit nameChanged();
    emit typeChanged();
    emit ageChanged();
    emit worksWithChanged();
    emit cityChanged();
    emit uniChanged();
  } else {
    m_signedIn = false;
  }
  delete query;
}

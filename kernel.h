#ifndef KERNEL_H
#define KERNEL_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QSqlResult>
#include <QDebug>

class Kernel : public QObject {
  Q_OBJECT
  Q_PROPERTY(bool signedIn READ signedIn WRITE setSignedIn)
  Q_PROPERTY(int whichSocial READ whichSocial WRITE setWhichSocial)
  Q_PROPERTY(int id READ id)
  Q_PROPERTY(QString login READ login WRITE setLogin NOTIFY loginChanged)
  Q_PROPERTY(QString pass READ pass WRITE setPass NOTIFY passChanged)
  Q_PROPERTY(QString name READ name NOTIFY nameChanged)
  Q_PROPERTY(QString type READ type NOTIFY typeChanged)
  Q_PROPERTY(int age READ age NOTIFY ageChanged)
  Q_PROPERTY(QString worksWith READ worksWith NOTIFY worksWithChanged)
  Q_PROPERTY(QString city READ city NOTIFY cityChanged)
  Q_PROPERTY(QString uni READ uni NOTIFY uniChanged)
public:
  explicit Kernel(QObject *parent = nullptr);
  ~Kernel();

  bool signedIn() { return m_signedIn; }
  int whichSocial() { return m_whichSocial; }
  int id() { return m_id; }
  QString login() { return m_login; }
  QString pass() { return m_pass; }
  QString name() { return m_name; }
  QString type() { return m_type; }
  int age() { return m_age; }
  QString worksWith() { return m_worksWith; }
  QString city() { return m_city; }
  QString uni() { return m_uni; }
  void setSignedIn(const bool &signedIn);
  void setLogin(const QString &login);
  void setPass(const QString &pass);
  void setWhichSocial(const int &whichSocial);

signals:
  void loginChanged();
  void passChanged();
  void nameChanged();
  void typeChanged();
  void ageChanged();
  void worksWithChanged();
  void cityChanged();
  void uniChanged();

private:
  bool m_signedIn = false;
  int m_whichSocial = 0;
  int m_id = 0;
  QString m_login = "";
  QString m_pass = "";
  QString m_name = "";
  QString m_type = "";
  int m_age = 0;
  QString m_worksWith = "";
  QString m_city = "";
  QString m_uni = "";
  QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

  void connectValues();
};

#endif // KERNEL_H

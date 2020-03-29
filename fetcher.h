#ifndef FETCHER_H
#define FETCHER_H

#include <QObject>
#include <QString>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class Fetcher: public QObject
{
  Q_OBJECT
public:
  Fetcher(QObject *parent = nullptr);
  void fetch(const QString &address);

signals:
  QNetworkReply *finished(QNetworkReply *pData);

private:
  QNetworkAccessManager* m_manager;
};
#endif // FETCHER_H

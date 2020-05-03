#ifndef FETCHER_H
#define FETCHER_H

#include <QHttpMultiPart>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>
#include <QString>

class Fetcher : public QObject {
  Q_OBJECT
public:
  Fetcher(QObject *parent = nullptr);
  void fetch(const QString &address);
  void post(QNetworkRequest request, QHttpMultiPart *data);

signals:
  QNetworkReply *finished(QNetworkReply *pData);

private:
  QNetworkAccessManager *m_manager;
};
#endif // FETCHER_H

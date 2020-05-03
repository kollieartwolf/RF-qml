#include "fetcher.h"

Fetcher::Fetcher(QObject *parent) : QObject(parent)
{
  m_manager = new QNetworkAccessManager(this);
  connect(m_manager, &QNetworkAccessManager::finished, this, &Fetcher::finished);
}

void Fetcher::fetch(const QString &address) {
  m_manager->get(QNetworkRequest(QUrl(address)));
}

void Fetcher::post(QNetworkRequest request, QHttpMultiPart *data) {
  m_manager->post(request, data);
}

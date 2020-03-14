#ifndef KERNEL_H
#define KERNEL_H

#include <QObject>

class Kernel : public QObject {
  Q_OBJECT
  Q_PROPERTY(bool signedIn READ signedIn WRITE setSignedIn)
public:
  explicit Kernel(QObject *parent = nullptr);

  bool signedIn();
  void setSignedIn(const bool &signedIn);

signals:
  void userNameChanged();

private:
  QString m_userName;
  bool m_signedIn;
};

#endif // KERNEL_H

#ifndef KERNEL_H
#define KERNEL_H

#include <QObject>

class Kernel : public QObject {
  Q_OBJECT
  Q_PROPERTY(bool signedIn READ signedIn WRITE setSignedIn)
  Q_PROPERTY(int whichSocial READ whichSocial WRITE setWhichSocial)
 public:
  explicit Kernel(QObject *parent = nullptr);

  bool signedIn();
  int whichSocial();
  void setSignedIn(const bool &signedIn);
  void setWhichSocial(const int &whichSocial);

 signals:
  void userNameChanged();

 private:
  bool m_signedIn;
  int m_whichSocial = 0;
};

#endif  // KERNEL_H

#include "kernel.h"

Kernel::Kernel(QObject *parent) : QObject(parent) {}

bool Kernel::signedIn() { return m_signedIn; }
int Kernel::whichSocial() { return m_whichSocial; }

void Kernel::setSignedIn(const bool &signedIn) {
  if (signedIn == m_signedIn) return;
  m_signedIn = signedIn;
}

void Kernel::setWhichSocial(const int &whichSocial) {
  if (whichSocial == m_whichSocial) return;
  m_whichSocial = whichSocial;
}

#include "kernel.h"

Kernel::Kernel(QObject *parent) : QObject(parent) {}

bool Kernel::signedIn() { return m_signedIn; }

void Kernel::setSignedIn(const bool &signedIn) {
  if (signedIn == m_signedIn)
    return;
  m_signedIn = signedIn;
}

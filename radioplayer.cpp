#include "radioplayer.h"

RadioPlayer::RadioPlayer(QObject *parent) : QObject(parent) {
  player = new QMediaPlayer(this, QMediaPlayer::StreamPlayback);
  player->setMedia(QUrl("http://s0.radioheart.ru:8000/RH23608"));
  player->setVolume(100);
}

void RadioPlayer::setEnabled(const bool &enabled) {
  if (enabled) {
    player->play();
  } else {
    player->stop();
  }
}

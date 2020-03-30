#include "radioplayer.h"

RadioPlayer::RadioPlayer(QObject *parent) : QObject(parent) {
  player = new QMediaPlayer(this);
  player->setVolume(100);
}

void RadioPlayer::setEnabled(const bool &enabled) {
  if (!enabled) {
    player->setMedia(QUrl(link));
    player->play();
  } else {
    player->stop();
  }
}

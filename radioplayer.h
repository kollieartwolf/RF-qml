#ifndef RADIOPLAYER_H
#define RADIOPLAYER_H

#include <QMediaPlayer>
#include <QObject>

class RadioPlayer : public QObject {
  Q_OBJECT
 public:
  RadioPlayer(QObject *parent = nullptr);
  void setEnabled(const bool &enabled);

 private:
  QMediaPlayer *player = nullptr;
};

#endif  // RADIOPLAYER_H

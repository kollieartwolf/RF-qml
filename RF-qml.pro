QT += qml quick svg xml

CONFIG += c++11 resources_big

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    kernel.cpp \
    main.cpp

RESOURCES += qml.qrc \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    LICENSE \
    arts/fonts/Rubik-Regular.ttf \
    arts/fonts/RubikMonoOne-Regular.ttf \
    arts/fonts/RubikOne-Regular.ttf \
    arts/icons/128/about.png \
    arts/icons/128/ask-write.png \
    arts/icons/128/back.png \
    arts/icons/128/home.png \
    arts/icons/128/map.png \
    arts/icons/128/megaphone.png \
    arts/icons/128/messages.png \
    arts/icons/128/news.png \
    arts/icons/128/people.png \
    arts/icons/128/program.png \
    arts/icons/128/rules.png \
    arts/icons/128/share.png \
    arts/icons/128/speakers.png \
    arts/icons/256/about.png \
    arts/icons/256/ask-write.png \
    arts/icons/256/back.png \
    arts/icons/256/home.png \
    arts/icons/256/map.png \
    arts/icons/256/megaphone.png \
    arts/icons/256/messages.png \
    arts/icons/256/news.png \
    arts/icons/256/people.png \
    arts/icons/256/program.png \
    arts/icons/256/rules.png \
    arts/icons/256/share.png \
    arts/icons/256/speakers.png \
    arts/icons/32/about.png \
    arts/icons/32/ask-write.png \
    arts/icons/32/back.png \
    arts/icons/32/home.png \
    arts/icons/32/map.png \
    arts/icons/32/megaphone.png \
    arts/icons/32/messages.png \
    arts/icons/32/news.png \
    arts/icons/32/people.png \
    arts/icons/32/program.png \
    arts/icons/32/rules.png \
    arts/icons/32/share.png \
    arts/icons/32/speakers.png \
    arts/icons/64/about.png \
    arts/icons/64/ask-write.png \
    arts/icons/64/back.png \
    arts/icons/64/home.png \
    arts/icons/64/map.png \
    arts/icons/64/megaphone.png \
    arts/icons/64/messages.png \
    arts/icons/64/news.png \
    arts/icons/64/people.png \
    arts/icons/64/program.png \
    arts/icons/64/rules.png \
    arts/icons/64/share.png \
    arts/icons/64/speakers.png \
    arts/icons/about.svg \
    arts/icons/ask-write.svg \
    arts/icons/back.svg \
    arts/icons/home.svg \
    arts/icons/map.svg \
    arts/icons/megaphone.svg \
    arts/icons/messages.svg \
    arts/icons/news.svg \
    arts/icons/people.svg \
    arts/icons/program.svg \
    arts/icons/radio.svg \
    arts/icons/roundbutton.svg \
    arts/icons/rules.svg \
    arts/icons/share.svg \
    arts/icons/speakers.svg \
    arts/images/TC.png \
    arts/images/TC1.png \
    arts/images/TC2.png \
    arts/images/aboutgif.gif \
    arts/images/signin.jpg

HEADERS += \
    kernel.h

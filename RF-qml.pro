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
    fetcher.cpp \
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
    fetcher.h \
    kernel.h

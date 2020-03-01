import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.14

Rectangle {
    id: rect

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#f07300" }
        GradientStop { position: 1.0; color: "#ffa400" }
    }

    ScrollView {
        id: scrollView
        width: rect.width
        height: rect.height
        ScrollBar.horizontal.policy: Qt.ScrollBarAlwaysOff

        AnimatedImage {
            id: animation
            width: scrollView.availableWidth
            enabled: false
            source: "arts/images/aboutgif.gif"
            fillMode: Image.PreserveAspectFit
            onWidthChanged: console.log(scrollView.width)
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}

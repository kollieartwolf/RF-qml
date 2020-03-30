import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: rect

    onHeightChanged: if (height > 0) headerText = "#ПРАВИЛА"

    FontLoader { id: fontR; source: "arts/fonts/Rubik-Regular.ttf" }

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#f07300" }
        GradientStop { position: 1.0; color: "#ffa400" }
    }

    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height
        contentWidth: -1
        contentHeight: name.y + name.height

        ScrollBar.horizontal.policy: Qt.ScrollBarAlwaysOff

        ColumnLayout {
            id: column
            width: rect.width

            Image {
                id: image
                source: "arts/images/ts.png"
                fillMode: Image.PreserveAspectFit
                enabled: false
                Layout.fillWidth: parent
            }

            Text {
                id: name
                font.family: fontR.name
                color: "#ffffff"
                text: kernel.getString("rules")
                wrapMode: Text.WordWrap
                font.pointSize: 12
                horizontalAlignment: Text.AlignLeft
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                y: image.y + image.height + 20
            }
        }
    }
}

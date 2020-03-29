import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: rect

    onHeightChanged: if (height > 0) headerText = "#КАРТА"

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
                source: "arts/images/map.png"
                fillMode: Image.PreserveAspectFit
                enabled: false
                Layout.fillWidth: parent
                Layout.margins: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            }

            Text {
                id: name
                color: "#ffffff"
                text: kernel.getString("map_text")
                font.pointSize: 16
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                y: image.y + image.height + 20
            }
        }
    }
}

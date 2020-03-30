import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.0

Rectangle {
    id: rect

    onHeightChanged: if (height > 0) headerText = "#RADIOHEART"

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
        contentHeight: image.height

        ScrollBar.horizontal.policy: Qt.ScrollBarAlwaysOff

        ColumnLayout {
            id: column
            width: rect.width

            Item {
                id: element
                width: rect.width
                height: image.height
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Image {
                    id: image
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    source: "arts/icons/radio.svg"
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea {
                    id: ma
                    anchors.fill: parent
                    onClicked: kernel.radioState = !kernel.radioState
                }

                ColorOverlay {
                    anchors.fill: image
                    source: image
                    color: ma.pressed ? "#cfcfcf" : "#ffffff"
                }
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

ToolButton {
    FontLoader { id: fontRO; source: "arts/fonts/RubikOne-Regular.ttf" }

    id: button
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.margins: 10
    icon.color: "#ffffff"
    font.family: fontRO.name

    contentItem: Item {
        anchors.fill: parent

        ColumnLayout {
            anchors.centerIn: parent

            Item {
                width: image.sourceSize.width
                height: image.sourceSize.height
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Image {
                    id: image
                    source: button.icon.source
                    sourceSize.width: 36
                    sourceSize.height: 36
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                ColorOverlay {
                    anchors.fill: image
                    source: image
                    color: button.down ? "#cfcfcf" : "#ffffff"
                }
            }

            Text {
                text: button.text
                font: button.font
                color: button.down ? "#cfcfcf" : "#ffffff"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
    }
    }

    background: Image {
        source: "arts/icons/roundbutton.svg"
        sourceSize.width: 512
        sourceSize.height: 512
        fillMode: Image.PreserveAspectFit
    }
}

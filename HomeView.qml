import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Image {
    source: "arts/images/TC2.png"

    GridLayout {
        anchors.fill: parent
        columns: parent.width > parent.height ? 3 : 2

        RFCircleButton {
            icon.source: "arts/icons/about.svg"
            text: qsTr("О ФОРУМЕ")
            onClicked: stack.push(aboutForum)
        }

        RFCircleButton {
            icon.source: "arts/icons/megaphone.svg"
            text: qsTr("РАДИО СОК")
        }

        RFCircleButton {
            icon.source: "arts/icons/speakers.svg"
            text: qsTr("СПИКЕРЫ")
        }

        RFCircleButton {
            icon.source: "arts/icons/program.svg"
            text: qsTr("ПРОГРАММА")
        }

        RFCircleButton {
            icon.source: "arts/icons/rules.svg"
            text: qsTr("ПРАВИЛА")
        }

        RFCircleButton {
            icon.source: "arts/icons/map.svg"
            text: qsTr("КАРТА")
        }
    }
}

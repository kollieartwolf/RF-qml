import QtQuick.Controls 2.0
import QtQuick 2.12
import QtQuick.Layouts 1.3

ToolBar {
    id: toolBar
    contentHeight: smallHeaderLabel.height > parent.height / 12 ? smallHeaderLabel.height : parent.height / 12

    background: Rectangle {
        color: stack.depth <= 1 ? "#ffa400" : "#f07300"
    }

    FontLoader { id: fontRMO; source: "arts/fonts/RubikMonoOne-Regular.ttf" }

    RowLayout {
        anchors.fill: parent

        RFUnborderedButton {
            id: backBtn
            visible: stack.depth > 1
            icon.source: "arts/icons/back.svg"
            icon.width: icon.height * 0.6

            onClicked: stack.pop()
        }

        Label {
            id: headerLabel
            text: headerText
            font.family: fontRMO.name
            font.pixelSize: 20
            leftPadding: backBtn.visible ? 0 : parent.width / 25
            color: "#FFFFFF"
        }

        Label {
            id: smallHeaderLabel
            text: qsTr("6 - 8\nавгуста")
            font.family: fontRMO.name
            font.pixelSize: 16
            horizontalAlignment: Qt.AlignHCenter
            color: "#FFFFFF"
            visible: !(stack.depth > 1)
        }
    }
}

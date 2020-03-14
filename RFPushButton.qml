import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Button {
    id: button

    FontLoader { id: fontR; source: "arts/fonts/Rubik-Regular.ttf" }

    text: qsTr("Вход")
    Layout.rightMargin: parent.width / 12
    Layout.leftMargin: parent.width / 12
    Layout.preferredHeight: 50
    Layout.fillHeight: false
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

    contentItem: Text {
        text: button.text
        font.family: fontR.name
        font.pointSize: 16
        opacity: enabled ? 1.0 : 0.3
        color: button.down ? "#cfcfcf" : "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        width: parent.width
        height: parent.height
        opacity: enabled ? 1 : 0.3
        color: "#f07c00"
        radius: 5
    }
}

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: rectangle

    property string placeholderText: ""
    property bool password: false
    property string rText: ""

    FontLoader { id: fontR; source: "arts/fonts/Rubik-Regular.ttf" }

    width: 250
    height: 50
    color: "#ffffff"
    radius: 6
    Layout.rightMargin: parent.width / 12
    Layout.leftMargin: parent.width / 12
    Layout.preferredHeight: 50
    Layout.fillHeight: false
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    
    TextField {
        id: textInput
        
        background: Rectangle {
            radius: rectangle.radius
        }
        
        text: rText

        onTextChanged: rText = text

        font.family: fontR.name
        color: "#ff8a00"
        echoMode: password ? TextInput.Password : TextInput.Normal
        placeholderText: rectangle.placeholderText
        placeholderTextColor: "#ff8a00"
        bottomPadding: rectangle.radius
        topPadding: rectangle.radius
        rightPadding: rectangle.radius
        leftPadding: rectangle.radius
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        font.pointSize: 18
        font.capitalization: Font.MixedCase
        verticalAlignment: Text.AlignVCenter
        selectByMouse: true
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
    }
    
}

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: rectangle

    property string placeholderText: ""
    property bool password: false

    width: 250
    height: 50
    color: "#ffffff"
    radius: 5
    Layout.rightMargin: 10
    Layout.leftMargin: 10
    Layout.preferredHeight: 50
    Layout.fillHeight: false
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    
    TextField {
        id: textInput
        
        background: Rectangle {
            radius: rectangle.radius
        }
        
        text: ""
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
        font.pointSize: 20
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

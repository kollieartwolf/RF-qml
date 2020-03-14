import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: signInRect

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#f07300" }
        GradientStop { position: 1.0; color: "#ffa400" }
    }

    FontLoader { id: fontR; source: "arts/fonts/Rubik-Regular.ttf" }

    ColumnLayout {
        id: column
        width: parent.width
        height: parent.height

        Image {
            id: image
            source: "arts/images/ts.png"
            fillMode: Image.PreserveAspectFit
            enabled: false
            Layout.fillWidth: parent
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        RFInputField {
            id: loginField
            placeholderText: qsTr("Логин")
            x: 74
        }

        RFInputField {
            id: passwordField
            placeholderText: qsTr("Пароль")
            password: true
            x: 74
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        RFPushButton {
            id: rFPushButton
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:7;anchors_height:200;anchors_width:200;anchors_x:8;anchors_y:8}
D{i:8;anchors_height:20;anchors_width:80;anchors_x:"-10";anchors_y:55}
}
##^##*/

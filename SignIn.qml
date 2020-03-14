import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: rect

    FontLoader { id: fontR; source: "arts/fonts/Rubik-Regular.ttf" }

    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height
        anchors.fill: parent

        ScrollBar.horizontal.policy: Qt.ScrollBarAlwaysOff

        ColumnLayout {
            id: column
            width: rect.width
            height: rect.height

            Image {
                id: image
                source: "arts/images/ts.png"
                fillMode: Image.PreserveAspectFit
                enabled: false
                Layout.fillWidth: parent
            }

            Item {
                height: 40
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
                height: 40
            }

            RFPushButton {
                id: rFPushButton
            }

            Item {
                Layout.fillHeight: parent
            }
        }
    }

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#f07300" }
        GradientStop { position: 1.0; color: "#ffa400" }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:8;anchors_height:20;anchors_width:80;anchors_x:"-10";anchors_y:55}
D{i:7;anchors_height:200;anchors_width:200;anchors_x:8;anchors_y:8}D{i:2;anchors_width:640}
}
##^##*/

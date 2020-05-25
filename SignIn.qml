import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14

Rectangle {
    id: rect

    onHeightChanged: if (height > 0) headerText = "#ПРОФИЛЬ"

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
                onRTextChanged: kernel.login = rText
            }

            RFInputField {
                id: passwordField
                placeholderText: qsTr("Пароль")
                password: true
                x: 74
                onRTextChanged: kernel.pass = rText
            }

            Text {
                property bool signInError: kernel.signInError

                id: element
                height: 40
                color: "#ffffff"
                fontSizeMode: Text.HorizontalFit
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: "Rubik"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                onSignInErrorChanged: text = signInError ? "Ошибка входа." : ""
            }

            RFPushButton {
                id: signInButton
                onClicked: kernel.sign()
            }

            Item {
                Layout.fillHeight: parent
            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

import QtQuick 2.0
import QtWebView 1.1
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12

Rectangle {
    id: rect
    color: "#f07300"

    FontLoader { id: fontR; source: "arts/fonts/Rubik-Regular.ttf" }

    property string fbUrl : "https://m.facebook.com/terrascientiaforum/"
    property string vkUrl : "https://m.vk.com/terrascientiaforum"
    property string instUrl : "https://www.instagram.com/terrascientiaforum"

    property int whichSelected: 0

    Rectangle {
        id: socialSelector
        width: parent.width
        height: rect.parent.height / 12
        color: "#00000000"

        RowLayout {
            id: sslt
            anchors.fill: parent

            Item {
                id: element
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: vkText
                    font.family: fontR.name
                    color: whichSelected == 0 ? "#800080" : "#ffffff"
                    text: "VKONTAKTE"
                    fontSizeMode: Text.HorizontalFit
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 12
                }
                MouseArea {
                    id: vkma
                    anchors.fill: parent
                    onClicked: if (webView.url != vkUrl) { webView.url = vkUrl; whichSelected = 0; }
                }
            }

            Item {
                id: element1
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Text {
                    id: fbText
                    font.family: fontR.name
                    color: whichSelected == 1 ? "#800080" : "#ffffff"
                    text: "FACEBOOK"
                    fontSizeMode: Text.HorizontalFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12
                }
                MouseArea {
                    id: fbma
                    anchors.fill: parent
                    onClicked: if (webView.url != fbUrl) { webView.url = fbUrl; whichSelected = 1; }
                }
            }

            Item {
                id: element2
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: instText
                    font.family: fontR.name
                    color: whichSelected == 2 ? "#800080" : "#ffffff"
                    text: "INSTAGRAM"
                    fontSizeMode: Text.HorizontalFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12
                }
                MouseArea {
                    id: ima
                    anchors.fill: parent
                    onClicked: if (webView.url != instUrl) { webView.url = instUrl; whichSelected = 2; }
                }
            }

        }
    }

    WebView {
        enabled: false
        id: webView
        x: 0
        y: socialSelector.y + socialSelector.height
        width: rect.width
        height: rect.height - socialSelector.height
        url: vkUrl
    }
}

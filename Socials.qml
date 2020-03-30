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
                width: parent.width / 3
                height: parent.height

                Text {
                    id: vkText
                    font.family: fontR.name
                    color: "#ffffff"
                    text: "VKONTAKTE"
                    fontSizeMode: Text.HorizontalFit
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 12
                }
                MouseArea {
                    id: vkma
                    anchors.fill: parent
                    onClicked: webView.url == vkUrl ? "" : webView.url = vkUrl
                }
            }

            Item {
                id: element1
                x: vkma.width
                width: parent.width / 3
                height: parent.height

                Text {
                    id: fbText
                    font.family: fontR.name
                    color: "#ffffff"
                    text: "FACEBOOK"
                    fontSizeMode: Text.HorizontalFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12
                }
                MouseArea {
                    id: fbma
                    anchors.fill: parent
                    onClicked: webView.url == fbUrl ? "" : webView.url = fbUrl
                }
            }

            Item {
                id: element2
                x: vkma.width + fbma.width
                width: parent.width / 3
                height: parent.height

                Text {
                    id: instText
                    font.family: fontR.name
                    color: "#ffffff"
                    text: "INSTAGRAM"
                    fontSizeMode: Text.HorizontalFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12
                }
                MouseArea {
                    id: ima
                    anchors.fill: parent
                    onClicked: webView.url == instUrl ? "" : webView.url = instUrl
                }
            }

        }
    }

    WebView {
        enabled: false
        id: webView
        x: 0
        y: socialSelector.y + socialSelector.height + 1
        width: rect.width
        height: rect.height - socialSelector.height
        url: vkUrl
    }
}

import QtQuick 2.0
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

            Rectangle {
                id: imageRect
                x: column.x
                y: column.x
                width: column.width / 3
                color: "#00ffffff"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.preferredHeight: imageRect.width
                implicitWidth: parent.width / 3

                Image {
                    id: image1
                    width: imageRect.width
                    height: imageRect.height
                    source: "arts/icons/circle.svg"
                    sourceSize.width: 512
                    sourceSize.height: 512
                    fillMode: Image.PreserveAspectFit
                    Layout.fillWidth: parent

                    Image {
                        id: image
                        width: imageRect.width / 2
                        height: imageRect.height / 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        sourceSize.height: 512
                        sourceSize.width: 512
                        source: "arts/icons/people.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Text {
                id: nameElement
                color: "#ffffff"
                text: kernel.name
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                font.pointSize: 16
                transformOrigin: Item.Center
            }

            Text {
                id: typeElement
                color: "#ffffff"
                text: kernel.type
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                font.weight: Font.Bold
                font.pointSize: 16
            }

            Text {
                id: ageElement
                color: "#ffffff"
                text: "Возраст: " + kernel.age
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.rightMargin: 20
                Layout.leftMargin: 20
                Layout.fillWidth: true
                font.pointSize: 16
            }

            Text {
                id: worksWithElement
                color: "#ffffff"
                text: "Направление деятельности: " + kernel.worksWith
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.fillWidth: true
                Layout.rightMargin: 20
                Layout.leftMargin: 20
                font.pointSize: 16
            }

            Text {
                id: cityElement
                color: "#ffffff"
                text: "Город: " + kernel.city
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.rightMargin: 20
                Layout.leftMargin: 20
                Layout.fillWidth: true
                font.pointSize: 16
            }

            Text {
                id: uniElement
                color: "#ffffff"
                text: "ВУЗ: " + kernel.uni
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.fillWidth: true
                Layout.rightMargin: 20
                Layout.leftMargin: 20
                font.pointSize: 16
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:9;anchors_height:71.33333333333333;anchors_width:71.33333333333333}
}
##^##*/

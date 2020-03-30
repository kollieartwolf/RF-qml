import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.14

Rectangle {
    id: rect
    color: "#f07300"

    onHeightChanged: if (height > 0) headerText = "#ОФОРУМЕ"

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#f07300" }
        GradientStop { position: 1.0; color: "#ffa400" }
    }

    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height
        contentWidth: -1
        contentHeight: name.y + name.height

        ScrollBar.horizontal.policy: Qt.ScrollBarAlwaysOff

        ColumnLayout {
            id: lt
            width: rect.width

            RFAnimation {
                id: animation
                source: "arts/images/aboutgif.gif"
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            }

            Text {
                id: name
                font.family: fontR.name
                color: "#ffffff"
                text: kernel.getString("about")
                wrapMode: Text.WordWrap
                font.pointSize: 16
                horizontalAlignment: Text.AlignLeft
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                y: animation.y + animation.height + 20
            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

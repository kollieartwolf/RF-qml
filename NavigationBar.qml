import QtQuick.Controls 2.12
import QtQuick 2.12
import QtQuick.Layouts 1.3

ToolBar {
    contentHeight: homeBtn.height > parent.height / 10 ? homeBtn.height : parent.height / 10

    background: Rectangle {
        color: "#FFA400"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        UnborderedButton {
            id: homeBtn
            icon.source: "arts/icons/home.svg"
            icon.width: width - 2
        }
        UnborderedButton {
            id: shareBtn
            icon.source: "arts/icons/share.svg"
            icon.height: height - 2
        }
        UnborderedButton {
            id: newsBtn
            icon.source: "arts/icons/news.svg"
            icon.width: width - 2
        }
        UnborderedButton {
            id: peopleBtn
            icon.source: "arts/icons/people.svg"
            icon.height: height - 2
        }
    }
}

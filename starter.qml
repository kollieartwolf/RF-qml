import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.impl 2.3

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 450
    height: 850
    title: qsTr("ВСмысле")

    header: HeadBar {}

    footer: NavigationBar {}

    StackView {
        id: stack
        initialItem: homeView
        anchors.fill: parent
    }

    Component {
        id: homeView

        HomeView {}
    }

    Component {
        id: aboutForum

        AboutForum {}
    }
}

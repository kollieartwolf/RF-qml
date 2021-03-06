import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.impl 2.3
import edu.russia.forum.kernel 1.0

ApplicationWindow {
    id: applicationWindow
    visible: false
    width: 320
    height: 600
    title: qsTr("ВСмысле")

    header: HeadBar {}
    property string headerText: "#ТСНАВСЕГДА"

    footer: NavigationBar {}

    Kernel {
        id: kernel
        onInitLoadedChanged: applicationWindow.visible = true
        onSignedInChanged: {
            stack.pop(0);
            stack.push(profile);
        }
    }

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

    Component {
        id: signIn
        SignIn {}
    }

    Component {
        id: profile
        Profile {}
    }

    Component {
        id: socials
        Socials {}
    }

    Component {
        id: map
        Map {}
    }

    Component {
        id: rules
        Rules {}
    }

    Component {
        id: radio
        Radio {}
    }
}

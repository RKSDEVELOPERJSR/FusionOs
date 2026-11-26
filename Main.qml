import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1280
    height: 720
    title: qsTr("Fusion OS - Unified Environment")

    // Theme and Layout Properties
    property bool isWindowsLayout: true
    readonly property color darkBackground: "#121212"
    readonly property color panelLight: "#ffffff"
    readonly property color panelDark: "#1e1e1e"

    // Main Desktop Background
    Rectangle {
        id: desktopEnv
        anchors.fill: parent
        color: darkBackground

        Text {
            anchors.centerIn: parent
            text: qsTr("Fusion OS Workspace")
            color: "#33ffffff"
            font.pixelSize: 32
        }
    }

    // Top Bar (for macOS layout)
    Rectangle {
        id: topMenuBar
        width: parent.width
        height: 30
        color: panelDark
        visible: !isWindowsLayout
        anchors.top: parent.top
        z: 10

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            Text {
                text: "Fusion OS"
                color: "white"
                font.bold: true
            }
            Item { Layout.fillWidth: true }
            Text {
                text: Qt.formatDateTime(new Date(), "dd MMM hh:mm AP")
                color: "white"
            }
        }
    }

    // Bottom Taskbar / Dock
    Rectangle {
        id: dock
        width: isWindowsLayout ? parent.width : appRow.implicitWidth + 30
        height: isWindowsLayout ? 48 : 64
        color: isWindowsLayout ? panelDark : "#802d2d2d"
        radius: isWindowsLayout ? 0 : 16
        border.color: isWindowsLayout ? "#33ffffff" : "#44ffffff"
        border.width: 1
        
        anchors.bottom: parent.bottom
        anchors.bottomMargin: isWindowsLayout ? 0 : 12
        anchors.horizontalCenter: parent.horizontalCenter
        z: 10

        Row {
            id: appRow
            anchors.centerIn: parent
            spacing: 12

            // Start Button / Layout Switcher
            RoundButton {
                text: isWindowsLayout ? "⊞" : "❖"
                font.pixelSize: 20
                palette.buttonText: "white"
                onClicked: isWindowsLayout = !isWindowsLayout
                ToolTip.text: qsTr("Toggle Windows / macOS Layout")
                ToolTip.visible: hovered
            }

            // Linux App Placeholder
            AppIcon { appName: "Linux Terminal"; iconChar: ">$"; appColor: "#4EAA65" }
            
            // Android App Placeholder
            AppIcon { appName: "Android Apps (Waydroid)"; iconChar: "🤖"; appColor: "#3DDC84" }
            
            // Windows App Placeholder
            AppIcon { appName: "Windows Apps (Wine/Proton)"; iconChar: "🗔"; appColor: "#0078D4" }
            
            // macOS App Placeholder
            AppIcon { appName: "macOS Apps (Darling)"; iconChar: ""; appColor: "#007AFF" }
        }
    }

    // Reusable App Icon Component
    component AppIcon : Rectangle {
        id: rootIcon
        required property string appName
        required property string iconChar
        required property string appColor

        width: 40
        height: 40
        radius: 8
        color: appColor

        Text {
            anchors.centerIn: parent
            text: rootIcon.iconChar
            font.pixelSize: 20
            color: "white"
        }

        MouseArea {
            id: iconMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: rootIcon.scale = 1.1
            onExited: rootIcon.scale = 1.0
            onClicked: console.log(rootIcon.appName + " launched!")
        }
        
        Behavior on scale { NumberAnimation { duration: 100 } }
        ToolTip.text: rootIcon.appName
        ToolTip.visible: iconMouseArea.containsMouse
    }
}

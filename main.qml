import QtQuick 2.12
import QtQuick.Window 2.12
import SimpleControls 1.0
import ExtControls 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    GradientButton{
        anchors.centerIn: parent;
        text: "Hello QML!";
    }
}

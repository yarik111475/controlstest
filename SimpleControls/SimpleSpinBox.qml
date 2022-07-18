import QtQuick 2.12
import QtQuick.Controls 2.12

SpinBox {
    id: control
    value: 0
    editable: true
    implicitWidth: 130;
    implicitHeight: 30;

    contentItem: TextInput {
        z: 2
        text: control.textFromValue(control.value)
        anchors.left: control.down.indicator.right;
        anchors.right: control.up.indicator.left;
        anchors.top: control.top;
        anchors.bottom: control.bottom;
        font: control.font;
        renderType: Text.NativeRendering;
        color: "black"
        selectionColor: "#21be2b"
        selectedTextColor: "#ffffff"
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        height: parent.height
        implicitWidth: 30;
        implicitHeight: 30;
        color: control.up.pressed ? "#e4e4e4" : "#f6f6f6"
        border.color: "black"

        Text {
            text: "+"
            font.pixelSize: control.font.pixelSize * 2
            renderType: Text.NativeRendering;
            color: "black"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width : 0
        height: parent.height
        implicitWidth: 30;
        implicitHeight: 30;
        color: control.down.pressed ? "#e4e4e4" : "#f6f6f6"
        border.color: "black";

        Text {
            text: "-"
            font.pixelSize: control.font.pixelSize * 2
            renderType: Text.NativeRendering;
            color: "black"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    background: Rectangle {
        //implicitWidth: 140
        border.color: "black";
    }
}

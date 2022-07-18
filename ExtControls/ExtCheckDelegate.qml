import QtQuick 2.12
import QtQuick.Controls 2.12

CheckDelegate {
    id: control
    width: 150;
    height: 25;

    contentItem: Text {
        rightPadding: control.indicator.width + control.spacing
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: "black";
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Rectangle {
        implicitWidth: control.height-4;
        implicitHeight: control.height-4;


        x: control.width - width - control.rightPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        radius: 3
        color: "transparent"
        border.color: "black";

        Rectangle {
            width: parent.width/2;
            height: width;
            anchors.centerIn: parent;
            radius: 2
            color: "dimgray";
            visible: control.checked
        }
    }

    background: Rectangle {
        implicitWidth: control.width;
        implicitHeight: control.height;
        visible: control.down || control.highlighted
        color: control.down ? "#bdbebf" : "#eeeeee"
    }
}


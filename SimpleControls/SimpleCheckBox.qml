import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox {
    id: control;

    indicator: Rectangle{
        height: 20;
        width: 20;
        border.width: 1;
        border.color: "black";
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 2;

        Rectangle {
            width: parent.width/2;
            height: parent.height/2;
            anchors.centerIn: parent;
            radius: 2;
            color: "dimgray";
            visible: control.checked
        }
    }

    background: Rectangle{
        width: control.width;
        height: control.height;
        radius: 5;
    }

    contentItem: SimpleText{
        font: control.font;
        text: control.text;
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing;
    }
}

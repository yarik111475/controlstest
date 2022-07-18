import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import SimpleControls 1.0


CheckBox {
    id: control;
    width: 15;
    height: 15;
    focusPolicy: Qt.ClickFocus;

    indicator: Rectangle{
        implicitWidth: control.width;
        implicitHeight: control.height;
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        border.width: 1;
        border.color: control.focus &&control.enabled ? "#0000FF" : (control.enabled ? "#000000" : "gray");
        radius: 2;

        Canvas{
            contextType: "2d";
            anchors.fill: parent;
            anchors.margins: 1;
            visible: control.checked;

            onPaint: {
                context.reset();
                context.lineWidth=2;
                context.lineJoin="round";

                context.moveTo(2, 5);
                context.lineTo(width/2, height-3);
                context.lineTo(width-2, 1);
                context.strokeStyle = control.enabled ? "black" : "dimgray";
                context.stroke();
            }
        }
    }

    contentItem: SimpleText{
        font: control.font;
        text: control.text;
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing;
        color: control.enabled ? "black" : "dimgray";
    }
}

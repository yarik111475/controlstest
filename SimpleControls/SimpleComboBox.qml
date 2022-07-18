import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

ComboBox {
    id: control;
    width: 100;
    height: 25;

    background: Rectangle{
        implicitWidth: control.width;
        implicitHeight: control.height;
        border.color: "black";
        border.width: 1;
        radius: 2;
    }

    contentItem: TextInput{
        readOnly: !control.editable;
        text: metrics.elidedText;
        font: control.font;
        renderType: Text.NativeRendering;
        leftPadding: 5;
        rightPadding: control.indicator.width + control.spacing;
        verticalAlignment: Text.AlignVCenter;

        TextMetrics{
            id: metrics;
            elide: Qt.ElideRight;
            font: control.font;
            text: control.displayText;
            elideWidth: control.width - indicator.width-control.spacing-control.rightPadding;
        }

        MouseArea{
            anchors.fill: parent;
            hoverEnabled: true;
            onEntered: {

            }
            onExited: {

            }
            onClicked: {
                control.popup.open();
                control.forceActiveFocus();
            }
        }
    }

    delegate: ItemDelegate {
        width: control.width;
        height: control.height;

        contentItem: Text {
            text: model[control.textRole];
            font: control.font;
            renderType: Text.NativeRendering;
            elide: Text.ElideRight;
            verticalAlignment: Text.AlignVCenter;
        }
        highlighted: control.highlightedIndex === index;
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding;
        y: control.topPadding + (control.availableHeight - height) / 2;
        width: 12;
        height: 8;
        contextType: "2d";

        Connections {
            target: control;
            function onPressedChanged() {
                canvas.requestPaint();
            }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? "gray" : "dimgray";
            context.fill();
        }
    }

    states: [
        State{
        },
        State{
        }
    ]
}

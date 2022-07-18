import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Button {
    id: control
    smooth: true;
    antialiasing: true;

    background: Rectangle{
        implicitWidth: contentItem.implicitWidth + contentItem.anchors.leftMargin + contentItem.anchors.rightMargin;
        implicitHeight: contentItem.implicitHeight + contentItem.anchors.margins * 2;
        border.color: "black";
        border.width: 1;
        radius: 2;

        MouseArea{
            anchors.fill: parent;
            hoverEnabled: true;
            onEntered: {
            }
            onExited: {
            }
            onPressed: {
            }
            onClicked: {
                control.clicked();
            }
        }
    }
    contentItem: Text{
        id: contentText;
        text: control.text;
        font: control.font;
        renderType: Text.NativeRendering;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        anchors.margins: 5;
        anchors.leftMargin: 10;
        anchors.rightMargin: 10;
    }
    states: [
        State{
        },
        State{
        },
        State{
        },
        State{
        }
    ]
}


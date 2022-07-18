import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12

Button {
    id: control
    smooth: true;
    antialiasing: true;

    background: Rectangle{
        implicitWidth: contentItem.implicitWidth + contentItem.anchors.leftMargin + contentItem.anchors.rightMargin;
        implicitHeight: contentItem.implicitHeight + contentItem.anchors.margins * 2;
        border.color: control.enabled ? "#FF6495ED" : "darkgray";
        border.width: 2;
        radius: 5;

        gradient: control.enabled ? enableGradient : disableGradient;

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
        color: control.enabled ? "black" : "darkgray";
    }
    states: [
        State{
            name: "Enable";
        },
        State{
            name: "Disable";
        },
        State{
        },
        State{
        }
    ]

    Gradient{
        id: enableGradient;
        GradientStop{
            color: "#FF6495ED";
            position: 0.0;
        }
        GradientStop{
            color: "#FFC0DEFF";
            position: 0.5;
        }
        GradientStop{
            color: "#FF6495ED";
            position: 1.0;
        }
    }
    Gradient{
        id: disableGradient;
        GradientStop{
            color: "#FFDCDCDC";
            position: 0.0;
        }
        GradientStop{
            color: "#FFF7F7F7";
            position: 0.5;
        }
        GradientStop{
            color: "#FFDCDCDC";
            position: 1.0;
        }
    }
}

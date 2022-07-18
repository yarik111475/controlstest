import QtQuick 2.12
import QtQuick.Controls 2.12

BusyIndicator {
    id: control

    contentItem: Item {
        implicitWidth: 100
        implicitHeight: 100;

        Item {
            id: item
            x: parent.width / 2 - 50;
            y: parent.height / 2 - 50;
            width: 100
            height: 100;
            opacity: control.running ? 1 : 0

            Behavior on opacity {
                OpacityAnimator {
                    duration: 250
                }
            }

            RotationAnimator {
                target: item
                running: control.visible && control.running
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 1500;
            }

            Repeater {
                id: repeater
                model: 20;

                Rectangle {
                    x: item.width / 2 - width / 2
                    y: item.height / 2 - height / 2
                    implicitWidth: 10
                    implicitHeight: 10
                    radius: implicitWidth/2;
                    color: "dimgray"
                    transform: [
                        Translate {
                            y: -Math.min(item.width, item.height) * 0.5 + 5;
                        },
                        Rotation {
                            angle: index / repeater.count * 360
                            origin.x: 5
                            origin.y: 5;
                        }
                    ]
                }
            }
        }
    }
}


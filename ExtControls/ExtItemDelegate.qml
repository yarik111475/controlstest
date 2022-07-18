import QtQuick 2.12
import QtQuick.Controls 2.12

ItemDelegate {
    id: control;
    width: 150;
    height: 25;

    Rectangle{
        implicitWidth: control.width;
        implicitHeight: control.height;
        Row{
            anchors.fill: parent;
            anchors.margins: 2;
            spacing: 5;

            ExtCheckBox{
                checked: modelData;
            }
        }
    }

}

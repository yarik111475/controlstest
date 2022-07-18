import QtQuick 2.12
import QtQuick.Controls 1.4


Tab {
    id: control;
    sourceComponent: Rectangle{
        color: "transparent";
        Rectangle{
            anchors.fill: parent;
            anchors.margins: 5;
        }
        //color: "red";
    }
}

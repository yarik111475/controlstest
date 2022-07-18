import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: control;
    width: 100;
    height: 25;
    leftPadding: 10;
    topInset: 0;
    bottomInset: 0;
    padding: 0;
    renderType: Text.NativeRendering;
    property bool bordered: true;

    background: Rectangle{
        implicitWidth: control.width + control.leftInset + control.rightInset;
        implicitHeight: control.height// + control.topInset + control.bottomInset;

        border.width: 1;
        border.color: bordered ? "black" : "transparent";
        radius: 2;
    }
}

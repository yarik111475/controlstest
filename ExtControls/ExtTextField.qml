import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

TextField {
    id: control;
    width: 100;
    height: 30;
    leftPadding: 10;
    renderType: Text.NativeRendering;

    background: Rectangle{
        implicitWidth: control.width + control.leftInset + control.rightInset;
        implicitHeight: control.height + control.topInset + control.bottomInset;

        border.width: 1;
        border.color: "black";
        radius: 2;

        RowLayout{
            anchors.fill: parent;
            anchors.margins: 0;
            anchors.bottomMargin: 10;
            visible: parent.text==="";
            spacing: 15;

            Image{
                width: 14;
                height: 19;
                source: "C:/Qt/projects/tests/controls_test/SimpleControls/images/delete.png"
                //opacity: 0.5;
            }
            Text{
                text: control.placeholderText;
                font: control.font;
                renderType: control.renderType;
                color: control.placeholderTextColor;
                Layout.fillWidth: true;
                opacity: 0.5;
            }
        }
    }
}

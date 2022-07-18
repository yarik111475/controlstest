import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls_1_4

Controls_1_4.TableView {
    id: control;
    signal sortByColumn(var column, var direction);
    property bool sortDirection: true;
    property bool isPressed: false;

    headerDelegate: Rectangle{
        id: header;
        implicitWidth: headerText.implicitWidth + headerText.anchors.margins * 2;
        implicitHeight: headerText.implicitHeight + headerText.anchors.margins * 2;
        border.width: 0.5;
        border.color: "#DDDDDD";
        color: styleData.pressed ? "#FFDAEBFE" : (styleData.containsMouse ? "#FFBBEBFE" : "white");

        Text{
            id: headerText;
            anchors.centerIn: parent;
            anchors.margins: 5;
            anchors.leftMargin: 10;
            anchors.topMargin: 10;
            font.bold: true;
            font.pixelSize: 12;
            renderType: Text.NativeRendering;
            color: "#FF444444";
            text: styleData.value;
        }

        Connections{
            target: styleData;
            function onPressedChanged(){
                if(styleData.pressed){
                    if(isPressed===true){
                        isPressed=false;
                        return;
                    }
                    sortByColumn(styleData.column, sortDirection);
                    sortDirection=!sortDirection;
                    isPressed=true;
                }
            }

        }
    }

    rowDelegate: Rectangle{
        color: styleData.selected ?"#FF6495ED" : (styleData.alternate ? "#FFCFDEFF" : "transparent");
    }

    itemDelegate: Text{
        leftPadding: 5;
        renderType: Text.NativeRendering;
        color: styleData.selected ? "white" : "black";
        font.bold: styleData.selected ? true : false;
        elide: styleData.elideMode;
        font.pixelSize: 12;
        text: styleData.value;
    }
}

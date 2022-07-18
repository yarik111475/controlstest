import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TabView {
    id: control;

    ExtTab{
        title: "Tab_1";
    }
    ExtTab{
        title: "Tab_2";
    }
    ExtTab{
        title: "Tab_3";
    }

    style: TabViewStyle {
        //frameOverlap: 10;
        //tabOverlap: 20;
        tab: Rectangle {
            gradient: styleData.selected ? enableGradient : disableGradient;
            //border.color:  "#DDDDDD"
            implicitWidth: text.width + text.anchors.leftMargin + text.anchors.rightMargin;
            implicitHeight: text.height + text.anchors.margins * 2;
            radius: 0;

            Text {
                id: text
                anchors.centerIn: parent;
                anchors.margins: 5;
                anchors.leftMargin: 15;
                anchors.rightMargin: 15;
                renderType: Text.NativeRendering;
                font.bold: true;
                text: styleData.title;
                color: "#00008B"
            }
        }
        frame: Rectangle {
            color: "#6495ED"
            //border.width: 1;
            //border.color: "#BBBBBB";
        }
        tabBar: Rectangle{
            color: "#E3E3E3";
            //border.width: 1;
            //border.color: "#BBBBBB";
        }
    }

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

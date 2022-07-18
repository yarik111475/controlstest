import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Calendar {
    id: control;
    property var daysArray: [qsTr("Пн"), qsTr("Вт"),qsTr("Ср"),qsTr("Чт"),qsTr("Пт"),qsTr("Сб"),qsTr("Вс")];

    style: CalendarStyle{
        gridVisible: false;

        navigationBar: Rectangle{
            height: 34;
            color: "#E7ECF1";
            border.width: 2;
            border.color: "white";

            Rectangle{
                height: parent.height - anchors.margins;
                width: height;
                anchors.left: parent.left;
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                anchors.margins: 5;
                color: "transparent";

                MouseArea{
                    anchors.fill: parent;
                    onClicked: control.showPreviousMonth();
                }

                Canvas{
                    anchors.fill: parent;
                    anchors.margins: 5;
                    contextType: "2d";

                    onPaint: {
                        context.reset();
                        context.moveTo(0, height/2);
                        context.lineTo(width, 0);
                        context.lineTo(width, height);
                        context.closePath();
                        context.fillStyle = control.pressed ? "gray" : "dimgray";
                        context.fill();
                    }
                }
            }

            Text{
                anchors.centerIn: parent;
                renderType: Text.NativeRendering;
                font.pointSize: 11;
                font.bold: true;
                text: styleData.title;
            }

            Rectangle{
                height: parent.height - anchors.margins;
                width: height;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                anchors.margins: 5;
                color: "transparent";

                MouseArea{
                    anchors.fill: parent;
                    onClicked: control.showNextMonth();
                }

                Canvas{
                    anchors.fill: parent;
                    anchors.margins: 5;
                    contextType: "2d";

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, height/2);
                        context.lineTo(0, height);
                        context.closePath();
                        context.fillStyle = control.pressed ? "gray" : "dimgray";
                        context.fill();
                    }
                }
            }
        }

        weekNumberDelegate: Item{}

        dayOfWeekDelegate: Rectangle{
            color: "white";
            width: 35;
            height: 30;

            Text{
                anchors.centerIn: parent;
                renderType: Text.NativeRendering;
                font.pointSize: 10;
                font.bold: true;
                color: (styleData.index===5 || styleData.index===6) ? "red" : "black";
                text: daysArray[styleData.index];
            }
        }

        dayDelegate: Rectangle{
            color: ((styleData.date.getDate()===new Date().getDate()) && (styleData.date.getMonth()===new Date().getMonth())) ? "#AAAAAA" : (styleData.selected ? "#CBE6EF" : "white");
            border.width: 1;
            border.color: styleData.selected ? "#45D6FA" : "transparent";

            Text{
                anchors.centerIn: parent;
                renderType: Text.NativeRendering;
                font.pointSize: 10;
                font.bold: styleData.selected || ((styleData.date.getDate()===new Date().getDate()) && (styleData.date.getMonth()===new Date().getMonth())) ? true : false;
                color: (styleData.selected && (styleData.date.getDate()===new Date().getDate())) ? "black" :
                       (!styleData.selected && styleData.date.getDate()===new Date().getDate()) ? "white" :
                       (styleData.visibleMonth ? "black" : "#777777");
                text: styleData.date.getDate();
            }
        }
    }
}

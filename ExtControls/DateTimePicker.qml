import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import SimpleControls 1.0

Rectangle {
    id: root;
    property alias placeholderText: txt.placeholderText;
    property int offset: 2;
    implicitWidth: row.implicitWidth + row.anchors.margins * 2;
    implicitHeight: row.implicitHeight + row.anchors.margins * 2;
    border.color: "black";
    border.width: 1;

    Row{
        id: row;
        anchors.fill: parent;
        anchors.margins: 2;
        spacing: offset;

        SimpleTextField{
            id: txt;
            width: 150;
            height: 25;
            font.pointSize: 10;
            verticalAlignment: Text.AlignVCenter;
            readOnly: true;
            bordered: false;
        }

        Rectangle{
            id: button;
            width: txt.height;
            height: width;

            Canvas{
                anchors.fill: button;
                anchors.margins: offset * 3;
                contextType: "2d";

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width/2, height);
                    context.closePath();
                    context.fillStyle = "dimgray";
                    context.fill();
                }
            }

            MouseArea{
                id: area;
                anchors.fill: button;
                onClicked: {
                    calendar.state=(calendar.state=="invisible") ? "visible" : "invisible";
                }
            }
        }
    }

    ExtCalendar{
        id: calendar;
        x: 0;
        y: row.height + offset * 2;
        state: "invisible";

        onClicked: {
            selectedDate=date;
            txt.text=dateString(date);
            calendar.state="invisible";
        }

        states: [
            State{
                name: "invisible";
                PropertyChanges{
                    target: calendar;
                    visible: false;
                    opacity: 0.0;
                }
            },
            State{
                name: "visible";
                PropertyChanges{
                    target: calendar;
                    visible: true;
                    opacity: 1.0;
                }
            }
        ]

        transitions: [
            Transition{
                from: "*";
                to: "*";

                PropertyAnimation{
                    target: calendar;
                    properties: "opacity";
                    duration: 300;
                }
            }
        ]
    }

    function resetCalendarText(placeholder){
        txt.text="";
        txt.placeholderText=placeholder;
        calendar.state="invisible";
    }

    function dateString(inputDate){
        var date,month,year;
        date=(inputDate.getDate()).toString().padStart(2,'0');
        month=(inputDate.getMonth() + 1).toString().padStart(2,'0');
        year=inputDate.getFullYear();
        return date + "." + month + "." + year;
    }
}

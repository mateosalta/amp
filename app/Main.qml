import QtQuick 2.4
import Ubuntu.Components 1.3
import Amp 1.0
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "amp.mateo-salta"

    width: units.gu(100)
    height: units.gu(75)

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Amplified Volume")
            StyleHints {
                foregroundColor: UbuntuColors.jet
                backgroundColor: "white
                dividerColor: UbuntuColors.slate
            }
        }



        Label {
            id: label
            objectName: "label"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: pageHeader.bottom
                topMargin: units.gu(2)
            }
        }

        Button {
            id: button
            objectName: "button"
            color: UbuntuColors.red
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: label.bottom
                topMargin: units.gu(2)
            }
            width: parent.width

            text: "enable amplified volume"

            onClicked: {
                        qprocess.launch("gsettings set com.ubuntu.sound allow-amplified-volume true")
                qprocess.launch("gsettings set com.canonical.indicator.sound amplified-volume-decibels 12")
            }}
            Button {
                id: button2
                objectName: "button"
                color: UbuntuColors.green
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: button.bottom
                    topMargin: units.gu(2)
                }
                width: parent.width

                text: "disable amplified volume"

                onClicked: {
                            qprocess.launch("gsettings set com.ubuntu.sound allow-amplified-volume false")
                    qprocess.launch("gsettings set com.canonical.indicator.sound amplified-volume-decibels -5")
                }}
            Rectangle {
           anchors.top: parent.bottom
                     Launcher {
                        id: qprocess
                     }


                     Text {
                       anchors.centerIn: parent
                       //text: qprocess.launch("which bash")
                     }
                   }

    }
}



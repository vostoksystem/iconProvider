import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaListView {
        anchors{
            top:parent.top
            left: parent.left
        }

        height: parent.height
        width: parent.width
        clip: true

        VerticalScrollDecorator {  }

        header: PageHeader {
            title: "Test Icon Provider";
        }

        model:  ListModel {
            id: listeModel

            ListElement {
                icon:"image://MyProvider/img/sdcard";
                desc:"Icon from qrc";
            }

            ListElement {
                icon:"../images/phone.png";
                desc:"Direct but no hightlight";
            }

            ListElement {
                // explaination : local is "<project root>/qml/images/phone.png"
                // path on provider is "qml/images" and will be added
                // therefore, id is just "phone"
                icon:"image://MyProvider/phone";
                desc:"Now with hightlighting";
            }
        }

        delegate: ListItem {
            id: item
            width: parent.width
            contentHeight:img.height

            property string l_icon: icon + "?" + (highlighted ?  Theme.highlightColor : Theme.primaryColor)

            Image {
                id: img
                anchors {
                    left: parent.left
                    leftMargin: Theme.horizontalPageMargin
                   // verticalCenter: parent.verticalCenter
                }
                width: Theme.iconSizeExtraLarge
                height:Theme.iconSizeExtraLarge
                source: item.l_icon
            }

            Item {
                height: dt.height + di.height
                anchors {
                    left: img.right
                    leftMargin: Theme.horizontalPageMargin
                    verticalCenter: parent.verticalCenter
                }

                Label {
                    id:dt
                    text: desc
                    color: Theme.primaryColor
                }
                Label {
                    id:di
                    anchors.top:dt.bottom
                    text: item.l_icon
                    color: Theme.primaryColor
                }
            }

        }



    }

}

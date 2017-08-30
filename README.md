# iconprovider
With an IconProvider you can load an icon (png) from qrc or local resources, in a specific colour with just an id string
IconProvider is a Qt class. It's made to work with Sailfish Os or regular Qt projects

* simple, only consist of 1 class to add to your project
* wokrs with qrc or plain url
* can add color on monochrome png
* qml ready, just register the IconProvider, use regular image:// url

Install
==================

1. Copy the src/iconprovider file to your src project directory.
2. Now edit the pro file to include the pri

Have a look at the sample project

Sample .pro file
------------------
Assuming you use the default name and location, for the project harbour-test_iconprovider :

```pro
TARGET = harbour-test_iconprovider

CONFIG += sailfishapp

include(src/iconprovider/iconprovider.pri)

SOURCES += src/harbour-test_iconprovider.cpp

OTHER_FILES += qml/harbour-test_iconprovider.qml \
    qml/cover/*.qml \
    qml/pages/*.qml \
    qml/images/*.png \
    rpm/harbour-test_iconprovider.changes \
    rpm/harbour-test_iconprovider.spec \
    rpm/harbour-test_iconprovider.yaml \
    harbour-test_iconprovider.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

RESOURCES += harbour-test_iconprovider.qrc

DISTFILES += harbour-test_iconprovider.qrc \
    qml/img/*.png
```
Usage
==================
You can use the iconProvider in Qt or qml
 
From Qml
------------------
Register the service passing a reference to your view, here an example for sailfish :

```
QScopedPointer<QQuickView> view(SailfishApp::createView());
IconProvider::init(view.data(),"MyProvider");
```

Assuming you created a file sdcard under resource img,You can then access image with url like this :
* image://MyProvider/img/sdcard

From Qt
------------------
create a new instance or just use the default one with getInstance.
id would then be :
* "img/sdcard"

Add colour
------------------
You can add colour to monochrome png

from qml : image://MyProvider/img/sdcard?#ff0000
from C++ : "img/sdcard?#ff0000"

Path format
==================

* path can be absolute
* if start by "~", set againt home directory
* if relative :  on sailfish resolve to the root of the project, for other QT project, relative to current working directory

Qrc resources have priority over local resources
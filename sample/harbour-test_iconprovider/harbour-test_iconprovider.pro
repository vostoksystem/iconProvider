# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
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


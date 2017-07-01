#!/bin/sh

#only for testing system, should launch in app supervisor...
udevd --daemon
udevadm trigger --type=subsystems --action=add
udevadm trigger --type=devices --action=add
udevadm settle --timeout=30

#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/event2:rotate=90:invertx=1:inverty=1
export QT_QPA_EGLFS_PHYSICAL_HEIGHT=1600
export QT_QPA_EGLFS_PHYSICAL_WIDTH=900

#rotate via config.txt
#export QT_QPA_EGLFS_ROTATION=90

qt-webkit-kiosk -c /etc/kiosk-test.ini


#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root oder sudo" 
   exit 1
fi

systemctl stop dme2sms
systemctl disable dme2sms
rm /etc/systemd/system/dme2sms.service

rm /etc/dme2sms-readserial/dme2sms-readserial.py
rmdir /etc/dme2sms-readserial

deluser dme2smsuser
groupdel dme2smsuser

rm /etc/rsyslog.d/20-dme2sms.conf
systemctl restart rsyslog

rm /etc/logrotate.d/dme2sms

echo "Uninstallation successful. Pip and pyserial were not removed as they possibly could be used by other software."

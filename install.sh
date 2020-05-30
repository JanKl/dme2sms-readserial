#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root or sudo" 
   exit 1
fi

# Install Pip for Python and the pyserial package
apt-get install -y python3-pip
sudo -H pip3 install pyserial

# Create a user for the application and create a working directory as well
useradd -r -s /bin/false dme2smsuser
mkdir -p /etc/dme2sms-readserial

# Allow user to access the serial interface
usermod -a -G dialout dme2smsuser

# Duplicate the program files to the new directory and allow the user to access it
cp dme2sms-readserial.py /etc/dme2sms-readserial
chown -R dme2smsuser:dme2smsuser /etc/dme2sms-readserial
chmod +x /etc/dme2sms-readserial/dme2sms-readserial.py

# Configure logging for the program
echo ":programname, startswith, \"dme2sms\"         /var/log/dme2sms.log" > /etc/rsyslog.d/20-dme2sms.conf
systemctl restart rsyslog

echo "/var/log/dme2sms.log { 
    su root syslog
    daily
    rotate 5
    compress
    delaycompress
    missingok
    postrotate
        systemctl restart rsyslog > /dev/null
    endscript
}" > /etc/logrotate.d/dme2sms

# Install the script as systemd service
cp dme2sms.service /etc/systemd/system
systemctl daemon-reload
systemctl enable dme2sms
systemctl start dme2sms

#!/usr/bin/python3

import serial
import requests
from datetime import datetime

# Configuration
class Config:
	def __init__(self):
		self.port = '/dev/ttyUSB0'
		self.baudRate = 9600
		self.httpAddress = 'https://some.url/endpoint'
		self.pagerEncoding = 'iso-8859-1'

# End of configuration
now = datetime.now()
nowPrint = now.strftime("%Y-%m-%d %H:%M:%S")
print(nowPrint + " dme2sms readserial service started")

config = Config()

def readFromSerial(port, baudRate):
	with serial.Serial(port, baudRate) as ser:

		while True:
			yield ser.readline()

def sendMessageToServer(message):
	requests.post(url = config.httpAddress, data = message) 
	messageString = str(message, config.pagerEncoding, 'ignore')
	now = datetime.now()
	nowPrint = now.strftime("%Y-%m-%d %H:%M:%S")
	print(nowPrint + " Sent " + messageString + "  to server")

for line in readFromSerial(config.port, config.baudRate):
	if not line or line == b'\r\n' or line == b'\x00\r\n': # Ignore empty lines
		continue
	sendMessageToServer(line)


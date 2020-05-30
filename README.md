# dme2sms-readserial
Liest Daten eines Swissphone-Pagers auf der seriellen Schnittstelle aus und überträgt sie per HTTP-POST an einen Server

## Vorbereitungen
1. Der Dienst wurde nur für Linux (Ubuntu 20.04 LTS) getestet.
1. Für die Ausführung wird ein Swissphone-Pager benötigt, der die alarmierten RICs auf der seriellen Schnittstelle ausgibt. Ein Swissphone BOSS 925 kann das beispielsweise. Der Pager muss über eine Programmierstation an einen COM-Port des Rechners angeschlossen werden.
1. Der Pager muss vor jeder übergebenen Nachricht die ausgelöste RIC und Funktion anzeigen. Das lässt sich am einfachsten über Fixtexte erreichen. Der Fixtext muss den siebenstelligen RIC und anschließend die Funktion als Buchstaben \[A,D\] enthalten. Es darf kein Zeilenumbruch folgen. An die Ausgabe auf der Kommandozeile schließt sich direkt die Nachricht an.

## Installation
1. Alle Dateien in einen Ordner nach Wahl entpacken.
1. Es müssen Port, Baudrate und die HTTP-Zieladresse angepasst werden. Die HTTP-Zieladresse erwartet die übermittelte Nachricht (komplett bestehend aus RIC, Funktion und eigentlicher Mitteilung) als POST-Body. Die entsprechenden Einstellungen finden sich in der Python-Skriptdatei ganz oben.
1. Die Paketquellen aktualisieren: `sudo apt-get update`.
1. Installation ausführen: `sudo ./install.sh`. Eventuell muss noch `chmod +x install.sh` ausgeführt werden, falls die Datei nicht ausführbar ist.
1. Der Dienst sollte jetzt laufen. Das kann mittels `sudo systemctl status dme2sms.service` überprüft werden.

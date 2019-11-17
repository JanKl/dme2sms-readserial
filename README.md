# dme2sms-readserial
Liest Daten eines Swissphone-Pagers auf der seriellen Schnittstelle aus und übertragt sie per HTTP-POST an einen Server

## Vorbereitungen/Installation
1. Der Dienst wurde nur für Linux (Ubuntu 18.04.3 LTS) getestet.
1. Für die Ausführung wird ein Swissphone-Pager benötigt, der die alarmierten RICs auf der seriellen Schnittstelle ausgibt. Ein Swissphone BOSS 925 kann das beispielsweise. Der Pager muss über eine Programmierstation an einen COM-Port des Rechners angeschlossen werden.
1. Der Pager muss vor jeder übergebenen Nachricht die ausgelöste RIC und Funktion anzeigen. Das lässt sich am einfachsten über Fixtexte erreichen. Der Fixtext muss den siebenstelligen RIC und anschließend die Funktion als Buchstaben \[A,D\] enthalten. Es darf kein Zeilenumbruch folgen. An die Ausgabe auf der Kommandozeile schließt sich direkt die Nachricht an.
1. Für den Dienst muss ein Benutzer angelegt werden. Der neue Benutzer muss Berechtigungen zum Zugriff auf die serielle Schnittstelle besitzen: `sudo usermod -a -G dialout USERNAME`

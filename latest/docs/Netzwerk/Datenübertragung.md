#Datenübertragung

###Vermittlungsarten
Die Vermittlungsart beschreibt den Weg zwischen zwei beliebigen Teilnehmern, also zwischen Sender und Empfänger in einem Netzwerk.

###Leitungsvermittlung
- **Definition:** (engl.: circuit switching, line switching)
- Durchgehende physikalische Verbindung mit konstanter Bandbreite
- Gesamte Leitungsbandbreite steht einem einzigen Kommunikationskanal zur Verfügung
- Verbindung steht ausschließlich den Beteiligten der Kommunikation zur Verfügung
- Auf- und Abbau der Verbindungen wird durch Verbindungsstellen realisiert
- Wegfindung durch Signalisierung zwischen Verbindungsstellen
- Verbindungsaufbau vor Kommunikation notwendig
- Klassisches Beispiel: Telefonnetz (P.O.T.S.)

###Paketvermittlung
- **Definition:** (engl.: packet switching)
- Ermöglicht die Kommunikation über ein Rechnernetzwerk
- Daten werden in Pakete (Datagramme) aufgeteilt und unabhängig voneinander durch das Netzwerk gesendet
- Übertragungswege sind unbekannt
- Effiziente Nutzung der Leitungsbandbreite
- Bandbreite eines Kommunikationskanals ist nicht konstant
- Keine Leistungsgarantien (QoS ist notwendig)

**Typischer Inhalt eines Pakets**
- Quelle des Paketes
- Ziel des Paketes
- Länge des Paketes
- Paketaufnummer
- Klassifizierung des Paketes
- Empfänger setzt die Datenpakete wieder komplett zusammen


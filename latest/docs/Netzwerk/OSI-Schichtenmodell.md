#OSI-Schichtenmodell, Protokolle und RFCs


###Unterschied zwischen DoD- und OSI-Schichtenmodell
- **OSI-Modell**: Allgemeines Referenzmodell mit **7 Schichten**
- **DoD-Modell (TCP/IP)**: Speziell für das Internet entwickelt mit **4 Schichten**

---

###Aufbau des OSI-Schichtenmodells
- Besteht aus **7 Schichten**, die sich in transport- und anwendungsorientierte Schichten unterteilen

---

###Anwendungs- und Transportorientierung der Schichten
- **Schichten 1-4**: Transportorientiert (physische Datenübertragung, Netzwerkverbindungen)
- **Schichten 5-7**: Anwendungsorientiert (Datenverarbeitung für den Nutzer)

---

###Architektur des OSI-Modells
- Jede Schicht hat definierte Aufgaben und Schnittstellen
- **Modulare Struktur** für Anpassbarkeit und Interoperabilität

---

###Kommunikationswege im OSI-Modell
- **Horizontale Kommunikation**: Zwischen gleichwertigen Schichten auf verschiedenen Geräten
- **Vertikale Kommunikation**: Zwischen benachbarten Schichten innerhalb desselben Geräts

---

###OSI-Layer Bezeichnungen (Deutsch & Englisch)
1. **Bitübertragungsschicht (Physical Layer)**
2. **Sicherungsschicht (Data Link Layer)**
3. **Vermittlungsschicht (Network Layer)**
4. **Transportschicht (Transport Layer)**
5. **Sitzungsschicht (Session Layer)**
6. **Darstellungsschicht (Presentation Layer)**
7. **Anwendungsschicht (Application Layer)**

---

###Beschreibung der 7 Schichten
- Jede Schicht hat eigene **Dienste**, **Aufgaben** und nutzt verschiedene **Protokolle**

---

###OSI Encapsulation
- Daten werden von der Anwendungsschicht bis zur Bitübertragungsschicht weitergereicht
- Jede Schicht fügt eigene **Header-Informationen** hinzu
- Beim Empfänger werden diese Header entfernt (Decapsulation)

---

###Zuordnung von Protokollen zu den Schichten
- **Schicht 1 (Physisch)**: Ethernet, WLAN
- **Schicht 2 (Data Link)**: MAC, ARP
- **Schicht 3 (Netzwerk)**: IP, ICMP
- **Schicht 4 (Transport)**: TCP, UDP
- **Schicht 5 (Sitzung)**: NetBIOS, RPC
- **Schicht 6 (Darstellung)**: SSL, TLS, JPEG
- **Schicht 7 (Anwendung)**: HTTP, FTP, SMTP

---

###Handshake-Verfahren
- **Dreiphasen-Handshake von TCP**
  1. **SYN**: Client sendet Verbindungsanfrage
  2. **SYN-ACK**: Server bestätigt Anfrage
  3. **ACK**: Client bestätigt Empfang, Verbindung ist aufgebaut

---

###Protokollarten
- **Verbindungsorientiert (z. B. TCP)**
  - Verbindung wird vor Datenübertragung aufgebaut
  - Sicher, aber langsamer durch Fehlerkorrekturen
- **Verbindungslos (z. B. UDP)**
  - Datenpakete werden direkt gesendet
  - Schnell, aber keine Garantie für fehlerfreie Übertragung

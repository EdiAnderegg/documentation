#OSI-Layer 2

Der **Data Link Layer (OSI-Layer 2)** stellt eine zuverlässige Verbindung zwischen direkt verbundenen Netzwerkgeräten her. Er ermöglicht die physikalische Adressierung, Fehlererkennung, Flusskontrolle und Segmentierung des Netzwerks.

---

###Aufgaben von Layer 2
- **Datenübertragung zwischen Knoten** in einem lokalen Netzwerk.
- **Fehlermanagement** durch Erkennung und Korrektur von Übertragungsfehlern.
- **Zugriffssteuerung** auf das Übertragungsmedium, um Kollisionen zu vermeiden.
- **Physikalische Adressierung** durch Verwendung der MAC-Adresse.
- **Flusskontrolle** zur Vermeidung von Überlastungen.

---

###MAC-Adresse (Media Access Control)
- **Eindeutige Adresse** jeder Netzwerkkarte, fest im Gerät hinterlegt.
- **48 Bit (6 Byte) in hexadezimaler Darstellung**.
- **OUI (Organizational Unique Identifier)** zur Identifikation des Herstellers.
- **EUI-64 für IPv6**-Adressen.
- **Broadcast-Adresse**: ff:ff:ff:ff:ff:ff.
- Unterteilung in **Quell- und Ziel-MAC-Adresse** in Ethernet-Frames.

---

####Bridges
- **Funktion**: Verbindung von zwei Netzwerksegmenten auf Layer 2.
- **Source Address Table (SAT)** speichert MAC-Adressen und zugehörige Ports.
- **Datenpakete werden nur weitergeleitet, wenn das Ziel in einem anderen Segment liegt.**
- **Verhinderung von Kollisionen zwischen Segmenten.**
- **Store-and-Forward-Prinzip:** Daten werden zwischengespeichert und überprüft.
- **Mac Flooding-Angriff:** Überflutung der SAT mit falschen MAC-Adressen, um Sicherheitslücken zu erzeugen.

---

####Kommunikation einer Bridge im OSI-Modell
- Arbeitet ausschließlich auf Layer 2.
- Keine Kenntnis von IP-Adressen (Layer 3).
- Datenverkehr innerhalb eines Segments wird nicht weitergeleitet.

---

####Switches
- **Multiport-Bridge**, die Daten gezielt an den richtigen Port weiterleitet.
- **Voll-Duplex-Unterstützung** für gleichzeitiges Senden und Empfangen.
- **Segmentierung der Kollisionsdomänen**, wodurch weniger Kollisionen auftreten.
- **Betriebsarten**:   
  - **Cut-Through**: Schnell, aber keine Fehlerprüfung.  
  - **Fragment-Free**: Vermeidung von beschädigten Frames mit reduzierter Verzögerung.  
  - **Store-and-Forward**: Verzögerung durch Fehlerprüfung.  
  - **Adaptive Cut-Through**: Kombination aus Cut-Through und Store-and-Forward, um je nach Fehlerquote die Betriebsart anzupassen.  

---

####Spanning Tree Protocol (STP)
- Verhindert **Switching-Loops** in vermaschten Netzwerken.  
- **Root Bridge**: Bestimmt die Netzwerktopologie.  
- **Zustände eines Ports im STP**: Blocking, Listening, Learning, Forwarding.  
- **Erweiterungen**:  
  - **RSTP (Rapid Spanning Tree Protocol)**: Schneller als STP (~6 Sekunden).    
  - **MSTP (Multiple Spanning Tree Protocol)**: Unterstützt mehrere VLANs.  

---

####Ethernet Frames Ethernet II
- **Datenpaket auf Layer 2**, bestehend aus:   
  - **Präambel** zur Synchronisation.    
  - **MAC-Quell- und Zieladresse**.  
  - **Typ**: Identifiziert Layer-3-Protokoll.    
  - **Datenfeld** mit Nutzdaten.  
  - **FCS (Frame Check Sequence)** zur Fehlererkennung.  

---

####Link Aggregation
- **Bündelung mehrerer physikalischer Verbindungen** zur Erhöhung der Bandbreite und Redundanz.
- **Implementierungen**:  
  - **LACP (Link Aggregation Control Protocol, IEEE 802.3ad)**.  
---

####ARP (Address Resolution Protocol)
- Übersetzt **IP-Adressen in MAC-Adressen** für die Kommunikation innerhalb eines Netzwerks.
- **ARP-Cache** speichert bekannte MAC-Adressen.
- **ARP-Spoofing**: Manipulation der ARP-Tabellen zur Durchführung von Man-in-the-Middle-Angriffen.

---

####Loops und ihre Vermeidung
- **Netzwerk-Schleifen entstehen durch redundante Verbindungen zwischen Switches**.
- **Switches senden Frames endlos in Schleife** (Broadcast Storm).
- **STP deaktiviert redundante Pfade**, um Loops zu verhindern.

---

####Cache-Manipulation / ARP-Spoofing
- **ARP-Spoofing**: Angreifer täuscht falsche MAC-Adressen vor.
- **Man-in-the-Middle-Angriffe** durch Umleiten des Netzwerkverkehrs.
- **Lösungen**: ARP-Inspection, statische ARP-Einträge, VPN-Tunnel.

---

####VLANs (Virtual Local Area Networks)
- **Unterteilung eines Netzwerks in mehrere logische Netzwerke.**
- **Jedes VLAN hat eine eigene Broadcast-Domäne.**
- **Kommunikation zwischen VLANs benötigt einen Router oder Layer-3-Switch.**
- **Typen:**  
  - **Portbasierte VLANs**: VLANs werden bestimmten Ports zugewiesen.  
  - **Tagged VLANs (IEEE 802.1Q)**: VLAN-Markierungen auf Frames.  
  - **Trunking**: Verbindung mehrerer Switches über ein gemeinsames VLAN-Link.  



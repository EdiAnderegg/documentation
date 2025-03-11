#Netzwerkverkabelung und UKV

Netzwerkkabel verbinden Komponenten innerhalb eines Computernetzwerks und sind essenziell für die Datenkommunikation. Sie ermöglichen den Datentransfer zwischen Endgeräten, Netzwerkkomponenten und Servern. Eine durchdachte Verkabelung ist entscheidend für die Netzwerksicherheit, Skalierbarkeit und Leistung.

---

### Glasfaserkabel

####Vor- und Nachteile
| Vorteile | Nachteile |
|----------|----------|
| Hohe Übertragungsraten (bis 40 Gbit/s) | Teurer als Kupferkabel |
| Keine elektromagnetischen Störungen | Mechanisch empfindlich |
| Große Reichweite (bis mehrere Kilometer) | Schwierige Installation |
| Zukunftssicher für steigenden Bandbreitenbedarf | Höherer Wartungsaufwand |

####Linklängen und Linkklassen
- **Linklänge** bezeichnet die maximal überbrückbare Entfernung zwischen aktiven Netzwerkgeräten.
- **Linkklassen (OF - Optical Fiber)**: OF-300 (bis 300 m), OF-500 (bis 500 m), OF-2000 (bis 2000 m)

####Kategorien
- **OM (Optical Multimode)**: OM1 bis OM5 – für kurze bis mittlere Distanzen
- **OS (Optical Singlemode)**: OS1 und OS2 – für weite Distanzen

####Fasertypen (Moden)
- **Singlemode Fiber (SMF)**: 9 µm Kerndurchmesser, höhere Bandbreiten und längere Übertragungsstrecken (bis 80 km)
- **Multimode Fiber (MMF)**: 50/62,5 µm Kerndurchmesser, kürzere Übertragungsdistanzen (bis 2 km), günstigere Herstellung

####Dämpfung 
- Signalverlust durch Streuung, Absorption oder Steckverbindungen (Ferrule)
- **Einfügedämpfung**: Verluste durch Verbindungsstellen
- **Rückflussdämpfung**: Reflexionen an Verbindungsstellen

---

###TP-Kabel (Twisted Pair Kabel)

###Aufbau
- Besteht aus mehreren verdrillten Adernpaaren
- **TP-Kabel (Twisted-Pair)**: Standard in Netzwerkinfrastrukturen

####Vor- und Nachteile
| Vorteile | Nachteile |
|----------|----------|
| Günstig | Anfällig für elektromagnetische Störungen (bei UTP) |
| Einfach zu verlegen | Begrenzte Reichweite (max. 100 m) |
| Unterstützt Power over Ethernet (PoE) | Höhere Latenz als Glasfaser |

####Kabelbezeichnungen/Kabeltypen
- **Schirmungsarten**:
  - UTP (Unshielded Twisted-Pair) → keine Abschirmung
  - STP (Shielded Twisted-Pair) → Abschirmung einzelner Adernpaare
  - S/FTP (Screened Foiled Twisted-Pair) → zusätzliche Gesamtschirmung

####Verbindungsarten
- **Straight-Through-Kabel**: Für Endgerät-zu-Netzwerkverbindung (PC-Switch, Router-Switch)
- **Crossover-Kabel**: Für direkte Verbindung zwischen zwei Endgeräten
- **Auto MDI-X (Automatic Medium-Dependent Interface Crossover)**: Moderne Switches erkennen automatisch, ob eine Kreuzung nötig ist

####Kategorien (ab CAT5 inkl. Spezifikationen)
| Kategorie | Frequenz | Geschwindigkeit |
|-----------|---------|----------------|
| CAT 5 | 100 MHz | 100 Mbit/s |
| CAT 5e | 100 MHz | 1 Gbit/s |
| CAT 6 | 250 MHz | 1 Gbit/s |
| CAT 6a | 500 MHz | 10 Gbit/s |
| CAT 7 | 600 MHz | 10 Gbit/s |
| CAT 8 | 2000 MHz | 40 Gbit/s |

---

###UGV/UKV

####Beschreibung der Hierarchieebenen 
- **Primärbereich**: Verbindung zwischen Gebäuden (Campus-Verkabelung)
- **Sekundärbereich**: Verbindung zwischen Stockwerken (Steigzonen)
- **Tertiärbereich**: Verbindung innerhalb eines Stockwerks (horizontale Verkabelung)

####Elemente der UKV
- **Patchfelder (Patchpanels)** zur Organisation der Verkabelung
- **Patchkabel** für flexible Verbindungen
- **Anschlussdosen** zur Geräteanbindung
- **Netzwerkkabel** für dauerhafte Verbindungen
- **Verteilerschränke (19-Zoll-Racks)** zur zentralen Unterbringung
- **Aktive Komponenten**: Switches, Hubs, Router
- **USV (Uninterruptible Power Supply, UPS)** für Netzwerksicherheit

####Vor- und Nachteile
| Vorteile | Nachteile |
|----------|----------|
| Standardisierte, strukturierte Verkabelung | Höhere Anfangsinvestition |
| Zukunftssicher durch flexible Erweiterbarkeit | Komplexer Installationsaufwand |
| Redundante Verbindungen für höhere Verfügbarkeit | Wartung erfordert Fachkenntnisse |

####UKV-Topologien
- **Stern-Topologie**: Häufigste Architektur, jede Verbindung führt zu einem zentralen Punkt
- **Baum-Topologie**: Erweiterte Stern-Topologie mit Unterverteilungen
- **Bus-Topologie**: Ältere Technologie, heute kaum mehr genutzt
- **Ring-Topologie**: Effizient, aber störanfällig

####Netzplanung
- Skalierbare Planung für zukünftige Erweiterungen
- **Redundante Netzwerkwege** zur Erhöhung der Ausfallsicherheit
- **Standards**: ISO/IEC 11801, EN50173, TIA 568 A/B

####Fehlerquellen und -behebung
**Typische Fehlerquellen**    
- **Physikalische Fehler**:  
  - Beschädigte Kabel oder Stecker  
  - Maximale Kabellängen überschritten  
  - Falsche Kabelkategorie verwendet (z. B. Mischung von CAT5 und CAT6)  
- **Konfigurationsfehler**:  
  - Falsche IP-Adressen oder Subnetze  
  - Fehlerhafte VLAN-Konfigurationen  
  - Inkorrekte Router- oder Firewall-Einstellungen  
  - **Spanning Tree Protocol (STP)** falsch konfiguriert  

####Fehlerbehebung
- **Ruhe** Die wohl wichtigste Regel bei der Fehler suche is Ruhig zu bleiben.
- **Kabeltester** zur Identifikation physikalischer Defekte
- **Netzwerkscanner** zur Überprüfung der IP-Konfiguration
- **Analyse von Netzwerkprotokollen** zur Fehlerlokalisierung
- **Regelmässige Wartung** zur Vermeidung von Problemen  




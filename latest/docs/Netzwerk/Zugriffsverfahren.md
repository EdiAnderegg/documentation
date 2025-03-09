#Zugriffsverfahren


###Komponenten des Physical Layers  
- **Stecker und Buchse**: Physische Schnittstellen für Netzwerkverbindungen.
- **Netzwerkkarte / Transceiver**: Hardwarekomponenten zur Datenübertragung.
- **Repeater**: Verstärkt und regeneriert Netzwerksignale.
- **Hub**: Verteilt Datenpakete an mehrere Geräte im Netzwerk.
- **Medienkonverter / GBIC (Gigabit Interface Converter)**: Wandelt Signale zwischen verschiedenen Übertragungsmedien um.

###Fehlerbehebung im Physical Layer  
- **Kollisionen**: Entstehen, wenn mehrere Geräte gleichzeitig senden.
- **Eigenschaften und Funktionen von L1-Geräten**: Wichtige Parameter zur Fehleranalyse in der Verkabelungsstruktur (UKV).

###Zugriffsverfahren im Physical Layer

Das **Zugriffsverfahren** (auch „logische Topologie“ genannt) regelt den Medienzugriff und koordiniert die Datenübertragung zwischen der Bitübertragungsschicht (Layer 1) und dem MAC-Layer (Layer 2a). Es hilft, Übertragungsfehler zu vermeiden.

####CSMA/CD (Carrier Sense Multiple Access / Collision Detection)
**Wird in Ethernet-Netzwerken genutzt**:
1. Station überprüft, ob das Medium frei ist.
2. Wenn frei, beginnt die Datenübertragung.
3. Bei gleichzeitiger Übertragung zweier Stationen kommt es zur Kollision.
4. Eine betroffene Station sendet ein **JAM-Signal** aus.
5. Alle betroffenen Stationen stoppen und starten nach einer zufälligen Verzögerung neu.

####CSMA/CA (Carrier Sense Multiple Access / Collision Avoidance)
**Wird in WLAN-Netzwerken genutzt**:
- Vermeidet Kollisionen durch das **RTS/CTS-Verfahren (Request to Send / Clear to Send)**.
- Station fragt das Medium an (RTS).
- Wenn keine andere Station sendet, erhält sie eine **Sendeerlaubnis (CTS)**.
- Nach der Übertragung wird das Medium freigegeben.

####Token-Passing (IEEE 802.4 / IEEE 802.5)
**Verfahren für deterministische Netzwerke**:
1. Ein **Token (Datenpaket)** wandert im Netzwerk.
2. Eine sendewillige Station wartet auf das Token.
3. Hat sie das Token, kann sie Daten anhängen und weitersenden.
4. Zielstation kopiert die Daten und bestätigt den Empfang.
5. Das Token kehrt zur ursprünglichen Station zurück und wird als **frei** markiert.



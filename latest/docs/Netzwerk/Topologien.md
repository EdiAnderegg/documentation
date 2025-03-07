#Topologien

Es gibt zwei unterschiedliche Arten von Netzwerktopologien

| **Physikalisch** | **Logische** |
|:---------|:------------|
|Art der Verbindungen zwischen den Netzwerkkomponenten | Sie beschreibt, wie die physikalische Verbindungen genutzt werden |


**Topologien Einfluss**  
- Maximale Ausdehnung  
- Übertragungsgeschwindigkeit  
- Hinzufügen bzw. Abkoppeln von Rechnern  
- Aufbereitung der Daten  
- Auswirkung bei Ausfällen von Netzwerkknoten  

---

###Bus Topologie
- Alle Geräte sind gemeinsam am gleichen Medium angeschlossen
- Die Enden sind mit einem Abschlusswiderständen ( 50 Ohm ) terminiert
- Übertragungsgeschwindigkeit 10 Mbit/s
- Es kann jeweils nur eine Station Daten übertragen, da sonst Kollisionen auftreten

![Bus Topologie](https://thietbikythuat.com.vn/wp-content/uploads/2021/04/Linear-Bus-Topology.jpg)

|**Vorteile**|**Nachteile**|
|:---|:---|
| Keine Störung bei Ausfall eines Rechners | Ein Kabelbruch führt zum Ausfall des gesamten Netzes |
| Geringe Verkabelungskosten | Ein Kabelfehler ist schwer zu orten |
| Leicht erweiterbar | Die Bandbreite/Übertragungsmediums wird geteilt |
|| Es ist nicht Abhörsicher |

---

###Ring Topologie 
- Ist ein geschlossener Ring (logisch)  
- Übertragungsrate 4, 16, 100 MBit/s  
- Wird nur über MAC-Adresse angesprochen  

![Ring Topologie](https://www.conceptdraw.com/How-To-Guide/picture/Ring-Network-Topology-diagram.png)

|**Vorteile**|**Nachteile**|
|:---|:---|
| Alle Stationen haben die gleichen Chancen auf Zugang zum Medium | Ein Kabelbruch führt zum Ausfall des gesamten Netzes |
| Leicht erweiterbar | Wenn die MAU ( Multistation Access Unit ) ausfällt, bedeutet dies, dass das gesamte Netz stehen bleibt. |
||Die Bandbreite/Übertragungsmediums wird geteilt |
|| Die Datenübertragung ist abhängig von der Anzahl Stationen |
|| Die Verkabelungskosten sind hoch |

---

###Stern Topologie
- Zentraler Vermittlungsknoten Switch oder ( Hub veraltet )  
- Kabellänge 100m pro Client
- CAT5 --> 100Mbit  
- CAT5e --> 1000Mbit

![Stern Topologie](https://englopedia.com/wp-content/uploads/2022/12/00-56.jpg)





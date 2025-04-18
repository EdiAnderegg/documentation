#Internet Protocol

- IP Adressen werden verwendet, um einen Host (PC oder jegliches Netzwerk Gerät) im Netzwerk zu identifizieren.
- Jedes Gerät in einem Netzwerk erhält eine eindeutige IP-Adresse. Damit kann jedes Gerät auch direkt identifizieren un kontaktieren. 
- Es gibt Private und Öffentliche IP-Adresssen 
- IP-Adressen können Statisch oder Dynamisch Vergeben werden.
- IANA (Internet Assigned Numbers Authority) ist zuständig für die Vergabe von Nummern und Namen im Internet. ( [iana](http://www.iana.org) )

---
*Aufbau:*   
32 Bit = 4 Oktette   
z.B: 192.168.5.68  

*Darstellung:*  
Dezimal ( mit Punkten getrennt )    
Binär ( für Berechnungen/Subnetting wichtig )  

---

###Adressklassen

|*Klasse*|*Präfix*|*Adressbereich*|*Netzmaske*|*Netzlänge(mit Präfix)*|*Host-länge*|*Netze*|*Hosts pro Netz*|*CIDR Suffix*|  
|:----|:----|:----|:---|:---|:---|:---|:---|:---|
| A | 0... | 0.0.0.0 - 127.255.255.255 | 255.0.0.0 |8 Bit|24 Bit|128|16.777.214|/8|
| B | 10... | 128.0.0.0 - 192.255.255.255 |255.255.0.0 | 16 Bit | 16 Bit | 16.384 | 65.534 | /16 |
| C | 110... | 192.0.0.0 - 223.255.255.255 | 255.255.255.0 | 24 Bit | 8 Bit | 2.097.152 | 254 | /24 |
| D | 1110... | 224.0.0.0 - 239.255.255 | Verwendung für Multicast-Anwendungen ||||||
| E | 1111... | reserviert ( für zukünftige Zwecke ) |||||||


---

###Adressklassen: Privat

|*Netzklasse*|*Adressbereich*|*Privater Bereich*|*Anzahl Adressen*|*CIDR Suffix*|
|:---|:---|:---|:---|:---|
| A | 0.0.0.0 - 127.255.255.255 | 10.0.0.0 - 10.255.255.255 | 16.777.216 | /8 |
| B | 128.0.0.0 - 191.255.255.255 | 172.16.0.0 - 172.31.255.255 | 1.048.576 | /12 |
| C | 192.0.0.0 - 223.255.255.255 | 192.168.0.0 - 192.168.255.255 | 65.536 | /16 |


Private IP-Adressen werden von Internet Router nicht geroutet.

---

###Reservierte IP-Adressen 
- 127.0.0.1 - 127.255.255.255 / Class A
	- Reserviert für Tests und Loopback 
	- Beim Ping 127.0.0.1 verifiziert Local Host das IP Protocol geladen.
- 169.254.0.1 - 169.254.255.255 / Class B
	- Wenn kein DHCP Server vorhanden ist, wird eine IP-Adresse automatisch vergeben. 
	- Wird von keinem Router Geroutet
- 224.0.0.0 - 239.255.255.255 / Class C
	- Verwendung für Multicast-Anwendungen 
- 240.0.0.0 - 255.255.255.255 / Class E
	- reserviert für zukünftige Zwecke 

---

###APIPA = Automatic Private IP Addressing
- Die Internet Assignet Numbers Authority (IANA) hat die Adresse 169.254.0.1 - 169.254.255.255 für Automatic Private IP Addressing reserviert.
- Ein Rechner, der mit APIPA läuft, hält alle fünf Minuten Ausschau nach einem DHCP-Server. Findet sich einer, verwirft der PC seine IP-Adresse und holt sich diese beim DHCP-Server.
- Man kann natürlich seinem Rechner auch manuell eine Adresse zuweisen. 

---

###IP-Adressierung / Subnetzmaske
- Aus einer IP-Adresse kann entnommen werden, aus welcher Netzklasse sie stammt
- Grösse der SN-Maske ist 32 Bit und kommt immer in Kombination mit der IP-Adresse vor.

---
###Segmentierung von Netzen 
- Durch sogenanntes IP-Subnetting können wir lediglich logische Netzwerke im gleichen physischen Netzwerk anlegen.
- Man kann zwei oder mehrere logische Netzwerke konfigurieren, indem man einfach unterschiedliche IP-Netzwerke zuweist: 192.168.0.0/24, 192.168.1.0/24 und so weiter.
- Das Problem an dieser Stelle ist, dass trotz der unterschiedlichen Netzwerke immer noch dasselbe Basisnetz verwendet wird. 
- Man kann sich dass so vorstellen, als würden Auto, Lastwagen etc. auf einer einspurigen Strasse befinden. 
- Besser wäre das Netzwerk mit VLANs in physikalisch getrennte Netzwerke zu teilen, somit wäre das Auto, Lastwagen etc. auf einer eigenen Spur.



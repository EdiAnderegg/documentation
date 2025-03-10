
#Switch Konfiguration
 
----

###Grundbefehle:

**Für Befehle:**  
Zuerst in den Konfigurationsmodus wechseln, damit die Befehle eingegeben werden können.

| **Befehle** | **Beschreibung**|
|:----|:-------|
|`config`| Konfigurationsmodus|
|`no`| Am Anfang eines Befehls zum Deaktivieren einer Konfiguration |
|``||
config-if: Schnittstelle VLAN oder physikalischer Port 
no: am Anfang eines Befehls: Wenn eine Konfiguration deaktiviert werden soll
show running-config: Allgemeine Konfigurationen im Switch

###Einfache Konfiguration eines Switches mit Trunking, VLANs und Ports

|Aktion| Befehle|
|:------------|:-------------|
| Konfigurationsmodus | `config` |
| Hostname setzen | `hostname xxxx` |
| Config-If modus | `interface vlan 1` |
| IP Adresse setzen | `ip address 192.168.10.10 255.255.255.0` |
|Wenn irgend ein Port oder ein VLAN deaktiviert ist | `no shutdown` |
| VLAN setzen | `vlan 15 ` |
| VLAN beschreiben im Interface(config-if) | `name "Test" ` |
| Ports Tabellen ansehen  | `show interfaces status` |
| Port auf VLAN  zuweisen | `interface gi4` gi4 ist der Port Name des Switches `switchport mode access`  `spanning-tree portfast`  `switchport access vlan 15`|
| Ports als Trunk Port mit VLANs  als allowed VLANs konfigurieren | `interface range GigabitEthernet5-6` `switchport mode trunk` `switchport trunk allowed vlan 15,16`|
| Aus einer configuration rausgehen  | `exit` |

Ein sinnvoller Name für den Hostnamen
Nie mit Leerzeichen arbeiten. 
Tabulator benutzen, um Befehle zu finden oder zu vervollständigen 


Tipp mit PuTTY:
(Rechtsklick) im PuTTY Icon ---> auf Copy all to Clipboard setzen 


#Switch Konfiguration (CISCO)
 
----

###Konfigurationsmodi

|**Bedeutung**|**Konsole**|
|:------------|:-----------------|
|User EXEC| `Switch>`|
|Privileged EXEC| `Switch#`|
|Global Configuration| `Switch(config)#`|
|Interface Configuration| `Switch(config-if)#`|
|Config-vlan| `Switch(config-vlan)#`|

###Grundbefehle:

| **Befehle** | **Beschreibung**|
|:----|:-------|
|`config`| Konfigurationsmodus|
|`no`| Am Anfang eines Befehls zum Deaktivieren einer Konfiguration |
|`show running-config`| Allgemeine Konfigurationen im Switch|


###Einfache Konfiguration eines Switches mit Trunking, VLANs und Ports

|**Aktion**|**Befehle**|
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

###Tipps:
- Ein sinnvoller Name für den Hostnamen  
- Nie mit Leerzeichen arbeiten.  
- Tabulator benutzen, um Befehle zu finden oder zu vervollständigen   

**mit PuTTY:**  
- (Rechtsklick) im PuTTY Icon ---> auf Copy all to Clipboard setzen   

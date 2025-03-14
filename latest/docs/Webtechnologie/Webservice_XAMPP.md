#Webserver mit (XAMPP)

###Aufgaben eines Webservers
 - Auslieferung statischer Dateien (z. B. HTML, CSS, Bilder)  
- Auslieferung dynamischer Inhalte (z. B. mittels serverseitiger Skriptsprachen wie PHP)  
- Zugriffsbeschränkung (HTTP-Authentifizierung)  
- Verschlüsselung (HTTPS)  
- Cookieverwaltung  
- Weiterleitungen (Rewrite-Engine)  
- Fehlerbehandlung (HTTP-Statuscodes und Fehlerseiten)  
- Protokollierung (Logdateien)  
- Caching zur Entlastung bei hohen Zugriffszahlen

--- 

###Installation eines Webservices (XAMPP)  

**XAMPP**: Enthält Apache, MySQL, PHP und Perl  
 
**Vorgehensweise:**  
- **Download:** Von [Apache Friends](https://www.apachefriends.org/de/index.html)  
- **Installation:** Das Paket Lokal installieren  
- **Start:** Apache (und ggf. MySQL) über das XAMPP-Kontrollpanel starten   
- **Überprüfung:** Sicherstellen, dass Apache läuft (Statusanzeige – grün; evtl. über den Browser `http://localhost` testen)  

**Port-Konflikte:**  
- Standardport für Apache: **80**  
- Standardport für Datenbank: **3306**   
**Prüfen:**  
Mit dem Befehl `netstat -a` (Konsole/Eingabeaufforderung) aktive Ports ermitteln    
**Lösung:**  
Bei Konflikten Ports wechseln (z. B. 8080 oder 8888)  

---

####Zentrale Konfiguration des Webservers

#####Konfigurationsdateien:
**httpd.conf:**  
- Haupt-Konfigurationsdatei (z. B. in `XAMPP\apache\conf\httpd.conf`)

**Wichtige Direktiven:**
  
| **Befehl** | **Beschreibung** |
|:----|:-----|
| `ServerRoot` | Verzeichnis der Serverprogramme |
| `Listen` | Port, auf dem der Webserver lauscht |
| `DocumentRoot` |Root-Verzeichnis für auszuliefernde Dateien, z. B. `htdocs` |
| `ErrorLog` und `AccessLog` | Protokollierung von Fehlern und Zugriffen |
| `Include` | Einbindung weiterer Konfigurationsdateien |

**httpd-vhosts.conf:**  
- Datei für die Konfiguration virtueller Hosts (normalerweise im Ordner `extra`)  

**Wichtige Hinweise:**  
- **Sicherheitskopien:** Vor jeder Änderung an Konfigurationsdateien eine Kopie anlegen  
- **Neustart:** Nach jeder Änderung den Webserver neu starten, damit die Änderungen wirksam werden

---

###Virtuelle Webserver (Name-Based Virtual Hosting)

Ein virtueller Webserver in Apache ist **eine eigenständige Webserver-Konfiguration, welche auf eine bestimmte URL reagiert**. Virtuelle Webserver können unter einer gemeinsamen IP-Adresse betrieben werden und werden aufgrund der URL voneinander unterschieden. Dies ist ab HTTP/1.1 möglich, vorausgesetzt, dass in der Request-Message der Hostname des gewünschten Webservers gesendet wird.

**Funktionsweise:**  
- Der Client sendet im Request den `Host:`-Header (z. B. `Host: www.customer1.local`), der dem Server mitteilt, welche Webseite ausgeliefert werden soll.  


####Erstellung und Konfiguration eigener virtueller Webserver (Virtual Hosts)

**Ziel:**  
Mehrere Webseiten (virtuelle Hosts) unter einer gemeinsamen IP-Adresse betreiben  

**Grundvoraussetzung:**  
HTTP/1.1 – der Client sendet den `Host:`-Header mit dem gewünschten Hostnamen


#####Schritte zur Einrichtung eines virtuellen Hosts:

**1. Verzeichnisstruktur anlegen:**  
- Erstellen Sie ein Basisverzeichnis (z. B. `C:\www`)  
- Für jedes Projekt einen eigenen Unterordner einrichten, z. B.  
- `C:\www\local-kunde1\public` mit einer Datei `index.html` (z. B. „Willkommen auf local-kunde1.ch“)

**2. Namenauflösung konfigurieren:**  
- Datei `C:\Windows\System32\drivers\etc\hosts` als Administrator bearbeiten  
- Zeile hinzufügen, z. B.:  
```apache
127.0.0.1 local-kunde1.ch
```  
- Testen Sie die Namensauflösung mit dem Befehl `ping local-kunde1.ch`  

**3. Virtuelle Hosts in Apache einrichten:**  
- Sichern Sie die Datei `httpd-vhosts.conf` (z. B. in `C:\XAMPP\apache\conf\extra\httpd-vhosts.conf`)  
- Fügen Sie einen Eintrag hinzu, z. B.:  
```xml
<VirtualHost *:80>
    ServerName local-kunde1.ch
    DocumentRoot "C:/www/local-kunde1/public"
    ErrorLog "C:/www/local-kunde1/log/error.log"
    CustomLog "C:/www/local-kunde1/log/access.log" common

    <Directory "C:/www/local-kunde1/public">
        DirectoryIndex index.html
        IndexOptions FancyIndexing FoldersFirst HTMLTable
        Options Indexes
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>

```

**4. Einbindung aktivieren:**  
- In der Datei `httpd.conf` die Einbindung der `httpd-vhosts.conf` aktivieren (Kommentarzeichen vor der Include-Anweisung entfernen)

**5. Webserver neu starten:**  
- Stoppen und starten Sie Apache, damit die Konfiguration übernommen wird

**6. Test im Browser:**  
- Öffnen Sie den Browser und rufen Sie `http://local-kunde1.ch` auf, um zu überprüfen, ob der virtuelle Host funktioniert

---

###Weitere Hinweise zur Arbeitsumgebung von Apache

**Dokumentenwurzel (Root):**  
- Alle über das Internet zugänglichen Dateien liegen im konfigurierten Root-Verzeichnis (z. B. `htdocs`)  
- Der Webserver kann nur Dateien innerhalb dieses Verzeichnisses ausliefern  

**Module:**  
- Der Apache kann durch Module (z. B. `mod_rewrite`, `mod_ssl`) erweitert werden, um zusätzliche Funktionen bereitzustellen  


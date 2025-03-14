#Das Web und seine Protokolle


###WWW (World Wide Web)   
Ein interaktives Informationssystem, das über das Internet zugänglich ist.  

####Adressierung im WWW

**URI (Uniform Resource Identifier):**  
- Eine Zeichenkette, die eine Ressource eindeutig identifiziert.  

**URL (Uniform Resource Locator):**  
- Eine spezielle Form des URI, die den Zugriffspfad angibt.  

**Aufbau:**  
```HTTP
<Schema>://<Host>/<Pfad>?<Abfrage>#<Fragment>
```

**Beispiele:** 
```http
http://www.beispiel.de/index.html` oder `mailto:someone@example.com
```

#####Kodierungsregeln
Sonderzeichen (z. B. `?`, `&`, `#`, `%`) und Nicht-ASCII-Zeichen (z. B. Umlaute) müssen per Escape-Sequenz kodiert werden (z. B. `%20` für Leerzeichen).

**URL-Parameter und Anker:**  
- Parameter folgen nach einem Fragezeichen (`?`) im Format `key=value`, mehrere Parameter werden mit `&` getrennt.  
- Der Fragment-Teil (z. B. `#liste`) dient zum Springen zu einem bestimmten Anker in einem Dokument.
 
**Das www:**  
- Wird oft als Alias (CNAME) verwendet, um den Servernamen ansprechbarer bzw. marketinggerechter zu gestalten – technisch ist es nicht zwingend erforderlich.

---

###Client‑Server-Modell:   

**Client (Browser):**  
Fordert Ressourcen (HTML, CSS, Bilder, etc.) an.  

**Server:**  
Verarbeitet die Anfragen und liefert die entsprechenden Dokumente oder Fehlermeldungen zurück.

**Proxy-Server:**  
- **Dual-Rolle:** Aus Sicht des Browsers fungiert der Proxy als Server (stellt Daten bereit), während er gegenüber dem eigentlichen Webserver als Client auftritt.  
- Er dient als Vermittler und kann Caching übernehmen, um Zugriffe zu beschleunigen.  

**Kommunikation:**  
Über HTTP (Hypertext Transfer Protocol) basierend auf einer TCP/IP-Verbindung. HTTP ist ein zustandsloses Protokoll.

---

###HTTP-Kommunikation: 12-Schritte-Ablauf

1. **TCP-Verbindung herstellen:**  
    - Der Client öffnet einen lokalen (ephemeren) Port (> 1024) und stellt eine Verbindung zum Server-Port 80 her.  
    - Dabei wird der TCP-Handshake (3‑Wege-Handshake) durchgeführt.  
2. **HTTP-Request in Version 1.1:**  
    - Sobald die TCP-Verbindung steht, beginnt der Client mit dem Senden einer HTTP-Anfrage nach dem Standard HTTP/1.1.  
3. **Request-Line:**  
    - Beispiel: `GET / HTTP/1.1`  
    - Hierbei fordert der Client die Ressource `/` (häufig die Startseite) an.  
4. **Host-Header:**  
    - Der Request enthält den Header `Host: www.zbw.ch`, der den Zielserver bzw. den virtuellen Host spezifiziert.  
5. **Connection-Header:**  
    - Mit `Connection: Keep-alive` signalisiert der Client, dass die TCP-Verbindung nach der Antwort offen bleiben soll.  
6. **Suche nach der Standardwebseite:**  
    - Der Webserver sucht im DocumentRoot nach der Standardwebseite, die über den DirectoryIndex (z. B. `index.html`) definiert ist.  
7. **Erstellen der HTTP-Response:**  
    - Der Webserver verpackt den Inhalt der Standardwebseite in den Body der Nachricht, berechnet die Content-Größe und erstellt die HTTP-Header, inklusive des Statuscodes `200 OK`.  
8. **Senden der HTTP-Response:**  
    - Die fertige HTTP-Nachricht (Status-Line, Header, Leerzeile und Body) wird über die bestehende TCP-Verbindung an den vom Client initiierten Port zurückgeschickt.  
9. **Empfang der Response:**  
    - Der Client empfängt die HTTP-Antwort auf dem entsprechenden Port und liest dabei Statuscode und Header aus.  
10. **Interpretation und Rendering:**  
    - Der Client (Browser) interpretiert die Header (z. B. `Content-Type`) und rendert den Inhalt des Bodys, sodass die Webseite korrekt dargestellt wird.  
11. **Anzeige im Browser:** 
    - Der gerenderte Inhalt wird im Browserfenster dem Nutzer angezeigt.  
12. **Verbleibende TCP-Verbindung:**  
    - Die TCP-Verbindung bleibt durch `Keep-alive` bestehen, bis ein Timeout eintritt. Anschließend wird die Verbindung seitens des Servers beendet.

---

###HTTP-Nachrichtenaufbau

1. **Request/Status-Line:**  
    (z. B. `GET / HTTP/1.1` oder `HTTP/1.1 200 OK`)  
2. **Allgemeine Header:**  
    (z. B. `Date:`, `Cache-Control:`, `Connection:`)  
3. **Spezifische Header:**  
    (Request- oder Response-spezifisch)  
4. **Entity Header (optional):**  
    (z. B. `Content-Type:`, `Content-Length:`)  
5. **Leerzeile:**  
    Trennt Header vom Body.  
6. **Body:**  
    Enthält die Daten (bei GET meist leer, bei POST Formulardaten etc.).  

---

###HTTP-Methoden

- **GET:**  
    Zum Abrufen von Daten (ohne Body).  
- **POST:**  
    Zum Senden von Daten (z. B. Formulareingaben; mit Body).  
- **PUT:**  
    Zum Hochladen oder Aktualisieren einer Ressource.  
- **DELETE:**  
    Zum Löschen einer Ressource.  
- **HEAD:**  
    Zum Abrufen von Headern ohne Body.  
- **OPTIONS:**  
    Zum Erfragen, welche Methoden der Server unterstützt.  
- **TRACE:**  
    Dient zu Debugging-Zwecken (Echo der Anfrage).  

**Beispiel einer HTTP GET Anfrage(HTTP/1.1)**
```http
GET / HTTP/1.1
Host: www.zbw.ch
Connection: Keep-alive
```

**Beispiel eines Post-Requests**
```http
POST /index.php HTTP/1.1
Host: www.zbw.ch
Content-Type: application/x-www-form-urlencoded
Content-Length: 33

parameter1=wert1&parameter2=wert2
```

---

###HTTP-Header-Informationen

Allgemeine Header (Request & Response)  


####Request-spezifische Header

**Beispiele:**    
- `Host:` (Ziel-Domain)  
- `User-Agent:` (Browser-Information)  
- `Accept:` (Medienformate)  
- `Accept-Language:` (Sprachpräferenz)  
- `If-Modified-Since:` (Bedingte Anfrage)  
- `Referer:` (Absender-URL)  
- `Authorization:` (Zugriffsberechtigung)  

###Response-spezifische Header

**Beispiele:**  
- Server:` (Server-Software)  
- `WWW-Authenticate:` (Auth-Anforderung)  
- `Retry-After:` (Wartezeit, Wiederholung)  
- `Age:` (Cache-Alter)`  


####Entity-Header (bezogen auf den Body)
Entity-Header enthalten Metainformationen zum Body einer HTTP-Nachricht wie:
- Typ,  
- Grösse  
- Kodierung  
die dem Empfänger helfen, die übertragenen Daten korrekt zu verarbeiten und darzustellen.  

**Beispiele:**    
- `Content-Type:` (z. B. `text/html; charset=UTF-8`)    
- `Content-Length:` (Berechnung der Byte-Grösse)   
- `Content-Encoding:`, `Last-Modified:`, `Expires:`  

**Wichtig:**  
In ==HTTP-Nachrichten trennen eine Leerzeile die Header von dem Body==.   
Sobald die leere Zeile (CRLF) erreicht wird, beginnt der Body.

---

###HTTP-Statuscodes

**2xx – Erfolg:**  
- `200 OK` – Die Anfrage wurde erfolgreich bearbeitet.
**3xx – Umleitung:**  
- `301 Moved Permanently` – Ressource dauerhaft verschoben.  
**4xx – Clientfehler:**  
- `400 Bad Request` – Syntaxfehler in der Anfrage.  
- `403 Forbidden` – Zugriff nicht gestattet.  
- `404 Not Found` – Ressource nicht gefunden.  
- `405 Method Not Allowed` – Methode nicht erlaubt.  
**5xx – Serverfehler:**  
- `500 Internal Server Error` – Interner Fehler des Servers.

---

###MIME-Typen (Medientypen)

**Definition:**    
Standardisierte Bezeichnungen, die angeben, um welchen Datentyp es sich handelt.

**Aufbau:**    
`Haupttyp/Subtyp` 
 
**Beispiele:**    
- `text/html` – HTML-Dokumente  
- `image/jpeg` – JPEG-Bilder  
- `application/pdf` – PDF-Dokumente

**Bedeutung:**  
- Browser nutzen den MIME-Typ, um den Inhalt korrekt zu interpretieren und darzustellen.

---

###Caching

**Ziel:**  
Reduzierung des Datenverkehrs und schnellere Ladezeiten.

**Arten:**      
- **Client-Cache (Browser)**    
- **Server-Cache**    
- **Proxy-Cache**   
  
####Wichtige Header:
`Cache-Control:`, `Expires:`, `Last-Modified:`, `ETag:`  

####Problematik:  
Veraltete Daten können erscheinen, wenn Inhalte schnell geändert werden.  

####Massnahmen:  
Senden von HTTP-Headern wie:  
```php
header('Cache-Control: no-cache, must-revalidate, proxy-revalidate');
header('Pragma: no-cache');
header('Expires: Thu, 15 Aug 1984 13:30:00 GMT');
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
```

Dadurch wird sichergestellt, dass keine zwischengespeicherten Daten verwendet werden.

####Proxy  
Der Proxy agiert als Server für den Browser (liefert gecachte Inhalte) und als Client gegenüber dem Webserver (leitet Anfragen weiter).  
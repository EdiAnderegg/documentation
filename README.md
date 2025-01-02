# Github Workflows
--------
### Dies ist eine Übung aus der GBS St.Gallen, die zeigt, wie Workflows in Github funktionieren
----------
## Nutzung:
- Laden Sie die Dateien lokal auf ihren Rechner herunter.
- Zu beachten ist, dass der Ordner "latest" und Ordner "beta" so benannt sein müssen.
- Die Aktionen werden ausgelöst, wenn ein tag gepusht wird. Zum Beispiel: "release/v1.0" oder "beta/v1.0"
----------------
## Zu Beachten
Dieser Workflow stellt eine Verbindug zum Server her und sendet einen Ordner namens "public". Achten Sie auf die benötigten Daten:
- Github Secrets: Erstellen Sie einen FTP_USER und FTP_PASSWORD und fügen Sie ihren Benutzernamen bzw. Ihr passwort in den entsprechenden Secrets ein.
- Ändern Sie den Domainnamen des Servers, mit dem Sie eine Verbindung herstellen möchten. (Stellen Sie sicher, dass der Server dies auch akzeptiert.)

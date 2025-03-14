#HTML - Struktur und Semantik


###Grundstruktur eines HTML-Dokuments

**Minimale Struktur:**   
Jedes HTML-Dokument beginnt mit einer Deklaration des Dokumententyps, gefolgt von den grundlegenden Containern.  

```html
<!DOCTYPE html> <!-- Prolog (Version des HTML) --> 
<html>  <!-- Dokument-Behälter (Container) -->
	<head>  <!-- Meta-Infos (Container) -->
	    <meta charset="UTF-8">
	    <title>Dein Seitentitel</title>
	</head>
	<body>  <!-- Inhalts-Behälter (Container) -->
	    <!-- Sichtbarer Inhalt -->
	</body>	
</html>
```

---

###Strukturieren, Gruppieren und Verlinken von Informationen

####Semantische Elemente:  
Nutzen Elemente, die den Inhalt in sinnvolle Bereiche gliedern  

- `<body>` (Inhaltsbereich)    
- `<header>` (Kopfbereich)    
- `<nav>` (Navigation)  
- `<main>` (Hauptinhalt)  
- `<section>` (Abschnitte)    
- `<article>` (Themen)  
- `<aside>` (Marginal Infos)      
- `<footer>` (Fussbreich)  

####Nicht-semantische Gruppierung  

- `<div>` Elemente als Container für CSS-Layout, wenn kein inhaltlicher Mehrwert vorliegt.  
- `<nav> <a>` Hyperlinks (Verlinken)  

**Beispiel Hyperlink:**  
```html
<!-- Angenommen, a2.html liegt im Verzeichnis "a" und verweist auf a1.html und a3.html -->
<nav>
    <a href="a1.html">Seite A1</a>
    <a href="a3.html">Seite A3</a>
    <a href="../b/b1.html">Wechsel zur Ebene B</a>
</nav>
```

---

###Syntax vs. Semantik

####Syntax:  

Die "Syntax" beschreibt die formalen Regeln und die korrekte Schreibweise eines HTML-Dokuments.
  
- Richtiges Schliessen von Tags  
- Eine korrekte Syntax ist notwendig, damit Browser den Code fehlerfrei interpretieren können (z. B. durch Validatoren wie den W3C-Validator).  

**Beispiel:**  
```html
<!-- Richtiges Schließen von Tags: -->
<p>Dies ist ein Absatz.</p>

<!-- Verwendung von Anführungszeichen bei Attributen: --> 
<img src="bild.jpg" alt="Beispielbild">
```

####Semantik

Semantik gibt den Elementen eine inhaltliche Bedeutung – sie macht den Code maschinenlesbar und verbessert die Barrierefreiheit und Suchmaschinenoptimierung.  

- Unterschied zwischen `<b>` (nur optische Hervorhebung) und `<strong>` (starke Betonung mit semantischem Mehrwert).  
- Verwendung von `<article>` für eigenständige Inhalte (z. B. Blog-Beiträge) im Vergleich zu einem allgemeinen `<div>`.  
- Semantische Elemente erleichtern es sowohl Suchmaschinen als auch Screenreadern, den Inhalt einer Seite zu verstehen.

---

###Beispiel Seitenstrukturierung

```html
<!doctype html>
<html>
<head>
    <title>Beispielseite</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <header>
        <!-- Headerbereich, z.B. für Logo, Banner, usw. -->
    </header>
    <nav>
        <!-- Navigationsbereich, wird mit CSS ausgerichtet -->
    </nav>
    <aside>
        <!-- Marginalienbereich, wird mit CSS ausgerichtet -->
    </aside>
    <section>
        <article>
            <!-- Inhaltstext, Bilder, usw. -->
        </article>
        <article>
            <!-- Inhaltstext, Bilder, usw. -->
        </article>
    </section>
    <footer>
        <!-- Fussbereich, Adresse, Links, usw. -->
    </footer>
</body>
</html>
```

---

###Textauszeichnungen und Formatierung

####Grundlegende Tags  
- **Überschriften:** `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>`  
- **Absätze:** `<p>`    
- **Fett:** `<b>`  
- **Kursiv:** `<i>`  
- **Exponenten:** `<sup>`  
- **Indizes:** `<sub>`  
- **Zeilenumbruch:** `<br />`  
- **Horizontale Linie:** `<hr />`

**Hinweis:**    
Tags, die im öffnenden Tag gleich wieder geschlossen werden (wie `<br />` und `<hr />`), benötigen kein separates Schlusstag. Alle anderen Elemente verlangen ein Schlusstag.  
Alle genannten Tags haben eine semantische Bedeutung, auch wenn diese manchmal nicht visuell umgesetzt wird.


####Weitere Textformatierung (Semantische Auszeichnungen)  
- **Starke Betonung:** `<strong>`  
- **Hervorhebung:** `<em>`  
- **Blockzitat:** `<blockquote>`  
- **Kurz-Zitat:** `<q>`  
- **Abkürzungen:** `<abbr>`  
- **Quellenangaben:** `<cite>`  
- **Definitionen:** `<dfn>`  
- **Adressen:** `<address>`  
- **Einfügen:** `<ins>`  
- **Löschen:** `<del>`  
- **Durchstreichen:** `<s>`

---

###Listen

####Geordnete Listen   
`<ol>` mit `<li>` (nummerierte Liste)

```html
<ol>
    <li>Erster Punkt</li>
    <li>Zweiter Punkt</li>
    <li>Dritter Punkt</li>
</ol
```

####Ungeordnete Listen  
`<ul>` mit `<li>` (Aufzählungspunkte)  

```html
<ul>
    <li>Erster Punkt</li>
    <li>Zweiter Punkt</li>
    <li>Dritter Punkt</li>
</ul>
```

####Definitionslisten  
`<dl>`, `<dt>`, `<dd>`  

```html 
<dl>
    <dt>HTML</dt>
    <dd>Hypertext Markup Language</dd>
    <dt>CSS</dt>
    <dd>Cascading Style Sheets</dd>
</dl>
```

####Erläuterung:  
Listen können beliebig verschachtelt werden, um komplexe Informationsstrukturen abzubilden. Sie eignen sich nicht nur zur Darstellung von Texten, sondern auch für Navigationselemente wie Drop-Down-Menüs. Dabei wird CSS zur Gestaltung intensiv genutzt.

 ---

###Block- und Inline-Elemente

####Blockelemente  
Diese Elemente nehmen die gesamte verfügbare Breite ein und beginnen auf einer neuen Zeile.

- `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>`  
- `<p>`  
- `<div>`  
- `<header>`, `<nav>`, `<footer>`, `<section>`, `<article>`, `<aside>`  
- `<blockquote>`  
- `<hr>`  
- `<ol>`, `<ul>`, `<li>`  
- `<table>`, `<tr>`, `<td>`, `<thead>`, `<tbody>`, `<tfoot>`

####Inline-Elemente    
Diese Elemente nehmen nur so viel Platz ein wie nötig und können nebeneinander angezeigt werden.

- `<a>`  
- `<span>`  
- `<img>`  
- `<strong>`, `<em>`, `<abbr>`, `<cite>`, `<code>`  
- `<input>`, `<select>`, `<textarea>`, `<label>`  
- `<sub>`, `<sup>`, `<br>`, `<button>`  
- `<small>`

---

###Tabellen  
Eine Tabelle stellt Daten in einem Raster aus Zeilen und Spalten dar, ähnlich wie ein Excel-Arbeitsblatt.

####Wichtige Punkte:  
- Eine Tabelle besitzt einen umfassenden Container `<table>`.  
- Zeilen werden mit `<tr>` definiert.  
- Zellen werden als Datenzellen (`<td>`) oder Header-Zellen (`<th>`) angegeben.  
- Jede Zeile sollte gleich viele Zellen enthalten, damit das Raster korrekt dargestellt wird.

```html
<table>
    <tr> <!-- Table Row -->
        <td>Information</td> <!-- Table Data-->
        <td>Information</td>
        <td>Information</td>
    </tr>
    <tr>
        <td>Information</td>
        <td>Information</td>
        <td>Information</td>
    </tr>
</table>
```

####Tabellenüberschriften und Rahmen

#####Tabellenüberschrift
Mittels `<th>` können Tabellenüberschriften definiert werden. Überschriften können zusätzlich mit dem Attribut `scope` (z. B. `scope="col"` oder `scope="row"`) präzisiert werden.  

```html
<table>
    <tr>
        <th scope="col">Überschrift 1</th> <!-- Überschrift für die col-->
        <th scope="col">Überschrift 2</th>
        <th scope="col">Überschrift 3</th>
    </tr>
    <tr>
        <td>Information</td>
        <td>Information</td>
        <td>Information</td>
    </tr>
</table>
```
#####Rahmenlinien
Das Attribut `border` kann genutzt werden, um Rahmen anzuzeigen. 

```html
<table border="1">
    <!-- Tabellendaten -->
</table>
```

####Zellen zusammenfassen

#####Spalten zusammenfassen  
Verwende das Attribut `colspan`, um Zellen über mehrere Spalten zu vereinen.

```html
<table>
    <tr>
        <th></th>
        <th>9am</th>
        <th>10am</th>
        <th>11am</th>
        <th>12am</th>
    </tr>
    <tr>
        <th>Monday</th>
        <td colspan="2">Geography</td>
        <td>Math</td>
        <td>Art</td>
    </tr>
</table>
```

#####Zeilen zusammenfassen  
Mit `rowspan` können Zellen über mehrere Zeilen zusammengefasst werden.

```html
<table border="1">
    <tr>
        <th></th>
        <th>ARD</th>
        <th>ZDF</th>
        <th>RTL</th>
    </tr>
    <tr>
        <th>18Uhr - 19Uhr</th>
        <td rowspan="2">Film</td>
        <td>Comedy</td>
        <td>Nachrichten</td>
    </tr>
    <tr>
        <th>19Uhr - 20Uhr</th>
        <td>Sport</td>
        <td>Klatschmagazin</td>
    </tr>
</table>
```

####Semantische Tabellenstruktur

#####Gliederung in Bereiche  
- **`<thead>`** für den Tabellenkopf    
- **`<tbody>`** für den Tabellenkörper    
- **`<tfoot>`** für den Tabellenfuss  

```html
<table border="1">
    <thead>
        <tr>
            <th>Datum</th>
            <th>Einnahmen</th>
            <th>Ausgaben</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>1. Januar</th>
            <td>250</td>
            <td>36</td>
        </tr>
        <tr>
            <th>2. Januar</th>
            <td>285</td>
            <td>48</td>
        </tr>
        <!-- Weitere Zeilen -->
    </tbody>
    <tfoot>
        <tr>
            <td>Total</td>
            <td>7824</td>
            <td>1241</td>
        </tr>
    </tfoot>
</table>
```

#####Überschrift mit `<caption>`    
Eine Tabelle kann zusätzlich eine Überschrift erhalten.

```html
<table border="1">
    <caption>Das Fernsehprogramm von heute</caption>
    <!-- Tabellendaten -->
</table>

```

#####Ünterschrift mit `<figcaption>`    
Wird häufig in Kombination mit `<figure>` genutzt.

```html
<figure>
    <table border="1">
        <caption>Das Fernsehprogramm von heute</caption>
        <!-- Tabellendaten -->
    </table>
    <figcaption>Letzte Aktualisierung um 15:45 Uhr</figcaption>
</figure>
```

####Beispiel Tabelle (Standortbestimmung)

```html
<table border="1">
  <tr>
    <th>Spalte 1</th>
    <th>Spalte 2</th>
    <th colspan="2">Spalte 3</th>
  </tr>
  <tr>
    <td rowspan="2" colspan="2">Zelle 1</td>
    <td>Zelle 3</td>
    <td rowspan="2">Zelle 4</td>
  </tr>
  <tr>
    <td>Zelle 7</td>
  </tr>
  <tr>
    <td colspan="4">Zelle 9</td>
  </tr>
</table>
```

---

###Formulare
  
Ein Formular wird genutzt, um Daten von Benutzern einzuholen. Es besteht aus einem Container `<form>` und verschiedenen Steuerelementen.

```html
<form action="http://server.tld/auswerten.php" method="post">
    <!-- Formularfelder -->
</form>
```
#####Wichtige Attribute
- **action:** Definiert das Ziel, an das die Daten gesendet werden.
- **method:** Bestimmt die Art der Datenübermittlung (z. B. `post` oder `get`).

####Texteingabe und Buttons

#####Textfeld
```html
<input type="text" name="firstname" />
```
#####Nummerisches Eingabefeld
```html 
<input type="number" name="age" />
``` 
#####Sende-Button
```html
<input type="submit" value="Senden" />
```
#####Alternativer Button (mit `<button>`)
```html
<button type="submit" name="submitButton" value="Senden">Senden</button>
```

####Mehrzeilige Eingabe
#####Textarea  
Für mehrzeilige Texteingaben.

```html
<textarea cols="30" rows="5" name="comments">Vorbelegter Text</textarea>
```

####Auswahlfelder
#####Dropdown-Liste mit `<select>` und `<option>`
```html
<select name="country">
    <option value="de">Deutschland</option>
    <option value="at">Österreich</option>
    <option value="ch">Schweiz</option>
</select>
```
#####Mehrfachauswahl  
Durch das Attribut `multiple` wird die Auswahl mehrerer Optionen ermöglicht.

```html
<select name="hobbies" multiple>
    <option value="sport">Sport</option>
    <option value="musik">Musik</option>
    <option value="lesen">Lesen</option>
</select>
```

####Beschriftung von Feldern (Labels)
Bindet ein Beschriftungselement an ein Formularfeld.

```html
<!-- for attribute bezieht sich auf ID vom input Element -->
<label for="username">Benutzername:</label>  
<input type="text" id="username" name="username" />

<!--oder als verschachteltes Element -->

<label>
    Benutzername:
    <input type="text" name="username" />
</label>
```

####Gruppierung von Formularfeldern
**Fieldset und Legend:** Dienen zur logischen Gruppierung von zusammengehörigen Feldern.

```html
<fieldset>
    <legend>Persönliche Daten</legend>
    <label for="fname">Vorname:</label>
    <input type="text" id="fname" name="firstname" />
    <label for="lname">Nachname:</label>
    <input type="text" id="lname" name="lastname" />
</fieldset>
```

####Formularelemente und Attribute

| **`type`**       | **Beschreibung**                                                        |
|:---------------- |:----------------------------------------------------------------------- |
| `button`         | Allgemeiner Button (kein Submit-Standardverhalten).                     |
| `checkbox`       | Ankreuzfeld für Mehrfachauswahl.                                        |
| `color`          | Farbwahl-Dialog (Farbpicker).                                           |
| `date`           | Datumseingabe (Kalender-Popup, wenn vom Browser unterstützt).           |
| `datetime-local` | Kombination aus Datum und Uhrzeit ohne Zeitzone.                        |
| `email`          | Eingabefeld für E-Mail-Adressen (Prüfung auf gültiges Format).          |
| `file`           | Datei-Upload-Feld (öffnet Dateidialog).                                 |
| `hidden`         | Verstecktes Eingabefeld (wird nicht angezeigt).                         |
| `image`          | Bildschaltfläche zum Absenden des Formulars.                            |
| `month`          | Eingabe von Jahr und Monat.                                             |
| `number`         | Numerisches Eingabefeld (mit Pfeiltasten zur Werteanpassung).           |
| `password`       | Verdeckte Eingabe (Punkte/Astern zur Maskierung).                       |
| `radio`          | Optionsfeld für exklusive Auswahl (mehrere Optionen, nur eine wählbar). |
| `range`          | Schieberegler zur Werteingabe in einem Bereich.                         |
| `reset`          | Schaltfläche zum Zurücksetzen des Formulars.                            |
| `search`         | Spezielle Darstellung für Suchfelder (Browserabhängig).                 |
| `submit`         | Schaltfläche zum Absenden des Formulars (Standardverhalten).            |
| `tel`            | Eingabefeld für Telefonnummern (Browserabhängig, z. B. Handy-Tastatur). |
| `text`           | Standard-Textfeld (einzeilig).                                          |
| `time`           | Uhrzeiteingabe (Stunden, Minuten, ggf. Sekunden).                       |
| `url`            | Eingabefeld für URLs (Prüfung auf gültiges URL-Format).                 |
| `week`           | Eingabe von Jahr und Kalenderwoche.                                     |

#####Nützliche Attribute:
|**`type`**|Beschreibung|
|:-------|:-----|
|`disabled`|Deaktiviert ein Eingabefeld.|
|`readonly`|Macht ein Feld nur lesbar.|
|`tabindex`|Legt die Tabulatorreihenfolge fest.|
|`accesskey`|Bestimmt ein Tastenkürzel.|
|`autofocus`|Das Feld erhält beim Laden automatisch den Fokus.|
|`autocomplete`|Aktiviert/deaktiviert die automatische Vervollständigung.|
|`placeholder`|Zeigt einen Platzhaltertext an.|
|`required`|Markiert ein Feld als Pflichtfeld.|

####Formular Beispiel
```html
<form action="http://example.com/submit" method="post">
  <fieldset>
    <legend>Persönliche Daten</legend>
    <label for="vorname">Vorname:</label>
    <input type="text" id="vorname" name="vorname" placeholder="Dein Vorname" required>
    <br>
    <label for="nachname">Nachname:</label>
    <input type="text" id="nachname" name="nachname" placeholder="Dein Nachname" required>
    <br>
    <label for="email">E-Mail:</label>
    <input type="email" id="email" name="email" placeholder="beispiel@domain.com" required>
  </fieldset>

  <fieldset>
    <legend>Interessen</legend>
    <label>
      <input type="checkbox" name="interessen" value="sport">
      Sport
    </label>
    <label>
      <input type="checkbox" name="interessen" value="musik">
      Musik
    </label>
    <label>
      <input type="checkbox" name="interessen" value="lesen">
      Lesen
    </label>
  </fieldset>

  <fieldset>
    <legend>Nachricht</legend>
    <label for="nachricht">Nachricht:</label>
    <br>
    <textarea id="nachricht" name="nachricht" rows="4" cols="50" placeholder="Schreibe deine Nachricht hier..."></textarea>
  </fieldset>

  <button type="submit">Absenden</button>
</form>
```


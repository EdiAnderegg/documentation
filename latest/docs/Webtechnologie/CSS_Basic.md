#CSS Basic


###Einbindung von CSS in HTML-Dokumente

####Externes Stylesheet

**Vorteile:**  
Wiederverwendbar, zentrale Verwaltung, saubere Trennung von Inhalt und Design.

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Beispielseite</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Hallo Welt</h1>
</body>
</html>
```

**Medienattribute:**   
```html
<link rel="stylesheet" href="css/print.css" media="print">
```

####Internes Stylesheet

**Vorteile:**  
Schnelle Anpassungen, hilfreich für einzelne Seiten.  

**Einbindung im `<head>`:**  
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Interne Styles</title>
    <style>
        h1 {
            font-family: Arial, sans-serif;
            color: blue;
        }
    </style>
</head>
<body>
    <h1>Hallo Welt</h1>
</body>
</html>

```

####Inline Styles

**Vorteile:**   
Schnelle Tests, spezielle Anpassungen an einzelne Elemente.  

```html
<h1 style="font-family: Arial, sans-serif; color: blue;">Hallo Welt</h1>
```

**Hinweis:** Inline Styles haben hohe Spezifität und sollten sparsam eingesetzt werden. (Sehr selten)

---

###Aufbau von CSS-Regeln, Selektoren und Eigenschaften

####Grundstruktur einer CSS-Regel

**Aufbau:**  
```css
selektor {
    eigenschaft: wert;
    /* weitere Deklarationen */
}
```

**Beispiel:**  
```css
p {
    font-size: 16px;
    color: #333;
}

/* Mehrere Selektoren*/
h1, h2, h3 {
    font-family: Verdana, sans-serif;
}

```

####Kommentare in CSS 

**Einzeilig:**  
```css
/* Dies ist ein einzeiliger Kommentar /*

/*   
Mehrzeiliger Kommentar
zur Dokumentation 
von Codeabschnitten. 
*/
```

---

###CSS-Selektoren und ihre Vielfalt


**Typselektor:**     
```css 
h1 { color: red; }
```

**Klassenselektor:**     
```css 
.highlight { background-color: yellow; }
```

**ID-Selektor:**    
```css 
#header { padding: 20px; }
```

---

####Kombinatoren und Vererbungsselektoren

**Descendant-Selektor:**  
```css
/*

Wählt alle Elemente, die Nachfahren (in beliebiger Tiefe) eines übergeordneten Elements sind.

"Alle p-Elemente innerhalb von article"
*/
article p { line-height: 1.5; }
```

**Kindselektor:**  
```css
/*
Wählt nur die unmittelbaren (direkten) Kind-Elemente eines übergeordneten Elements.

"Nur direkte li-Kinder von ul"
*/

ul > li { list-style: none; }
```

**Adjacent Sibling-Selektor:**  
```css
/*
Wählt das erste Element, das unmittelbar nach einem bestimmten Element folgt (direkter Geschwister).

"Direkt folgendes p-Element nach h1"
*/
h1 + p { margin-top: 0; }
```

**General Sibling-Selektor:**  
```css
/*
Wählt alle Geschwister-Elemente, die einem bestimmten Element folgen, nicht nur das unmittelbar folgende.

"Alle p-Elemente nach h1, egal ob direkt oder nicht"
*/

h1 ~ p { color: gray; }
```

####Attributselektoren

**Beispiele:**  
```css
/* Alle Elemente mit dem Attribut "data-info" */
[data-info] { 
	border: 1px solid blue;
}

/* Elemente, deren Attribut "type" mit "text" beginnt */
input[type^="text"] { 
	background-color: #f0f0f0; 
}
```

---

###Überschreiben von CSS-Regeln, Kaskade und Spezifität

####Das Prinzip der Kaskade
**Quellenpriorität von CSS-Regeln**

| **Prioritätsstufe** | **Quelle**                          | **Beschreibung**                                                                                                                                 |
| :------------------- |:----------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1                   | Benutzerstylesheet mit `!important` | Vom Nutzer voreingestellte, individuelle Styles (über Browser-Einstellungen/Erweiterungen), die mit `!important` die höchste Priorität erhalten. |
| 2                   | Autorenstylesheet mit `!important`  | Vom Entwickler definierte Styles, die mit `!important` markiert wurden, um sich gegenüber anderen Regeln durchzusetzen.                          |
| 3                   | Autorenstylesheet                   | Standard CSS-Regeln, die der Webentwickler in den Stylesheets vorgibt.                                                                           |
| 4                   | Benutzerstylesheet                  | Eigene Anpassungen des Nutzers (z. B. benutzerdefinierte CSS-Dateien, Browseroptionen), ohne `!important` markiert.                              |
| 5                   | Browserstylesheet                   | Voreingestellte Standardstyles des Browsers, die angewendet werden, wenn keine anderen Styles vorhanden sind.                                    |

**Reihenfolge:**  
Bei gleichen Selektoren gewinnt die zuletzt definierte Regel.

####Spezifität von Selektoren

| Selektortyp      | Beispiel                 | Kurze Erklärung (Stichworte)                                  | Punkte |
| ---------------- | ------------------------ | ------------------------------------------------------------- | ------ |
| Inline-Style     | `<p style="color:red;">` | Direkt im Element definiert, höchste Priorität                | 1000   |
| ID-Selektor      | `#header`                | Selektiert ein Element anhand seiner eindeutigen ID           | 100    |
| Klassenselektor  | `.highlight`             | Selektiert Elemente mit einer bestimmten Klasse               | 10     |
| Attributselektor | `[type="text"]`          | Selektiert Elemente, die einen bestimmten Attributswert haben | 10     |
| Pseudoklasse     | `:hover`                 | Selektiert Elemente in einem bestimmten Zustand               | 10     |
| Typselektor      | `p`                      | Selektiert alle Elemente eines bestimmten Typs (z.B. Absätze) | 1      |
| Pseudoelement    | `::before`               | Selektiert generierte Inhalte vor einem Element               | 1      |

**Beispiel:**  
```css

/* 
Spezifität Berechnung
.main   = 0010
[src=*] = 0010
li      = 0001
a       = 0001
Summe:    0022
*/
.main [src=*] > li a{
	color: blue;
}

/*===================*/

/* 
Spezifität = 0123
header   = 0001  (Typ)
.class1  = 0010  (Klasse)
#class2  = 0100  (ID)
img      = 0001  (Typ)
.logo    = 0010  (Klasse)
:before  = 0001  (Pseudoelement)
Summe:          0123
*/
header.class1#class2 img .logo:before{
	color: blue;
}

/*===================*/

/* Spezifität = 0021
.img     = 0010  (Klasse)
img      = 0001  (Typ)
.img-2   = 0010  (Klasse)
Summe:     0021
*/
.img > img.img-2{
	color: blue;
}

/*===================*/

/* Spezifität = 0022
table     = 0001  (Typ)
h1.header = 0011 (Typ h1: 0001 + Klasse .header: 0010)
.lorem    = 0010  (Klasse)
Summe:      0022
*/
table + h1.header > .lorem{
	color: blue;
}

/*===================*/

/* Spezifität = 0013
a         = 0001  (Typ)
:hover    = 0010  (Pseudoklasse)
span      = 0001  (Typ)
+ span    = 0001  (Typ)
Summe:          0013
*/
a:hover > span + span{
	color: blue;
}

/*===================*/

/* Spezifität = 0023
ul        = 0001  (Typ)
li.active = 0011 (Typ li: 0001 + Klasse .active: 0010)
a:active  = 0010  (Pseudoklasse)
Summe:          0023
*/
ul > li.active > a:active{
	color: blue;
}
```
    
####Übersteuerung von CSS-Regeln

**Regeln überschreiben:**   
Höhere Spezifität oder spätere Deklaration gewinnt.

**Beispiel:**  
```css
p { color: black; }       /* Allgemeine Regel */
.intro p { color: gray; }   /* Höhere Spezifität */

```

---


###Farben

####Eigenschaften:  
- **`color`** (Vordergrundfarbe/Textfarbe)  
- **`background-color`** (Hintergrundfarbe)

####Farbformate:
- **Namentliche Farben:** z. B. `red`, `blue`, `tomato`
- **Hexadezimal:** z. B. `#ff0000`
- **RGB:** z. B. `rgb(255, 0, 0)`
- **RGBA:** z. B. `rgba(255, 0, 0, 0.5)` (inkl. Transparenz)
- **HSL:** z. B. `hsl(0, 100%, 50%)`
- **HSLA:** z. B. `hsla(0, 100%, 50%, 0.5)`

```css
h1{
	color: tomato;
	background-color: #fff;
}

p{
	color: rgb(255, 220, 200);
	background-color: hsl(0, 100%, 50%);
}
```

---

###Text  

####Typografie:
- **`font-family`**: Legt die Schriftart fest  
- **`font-size`**: Schriftgröße (z. B. `16px`, `1em`)  
- **`font-weight`**: Schriftstärke (z. B. `normal`, `bold`)  
- **`font-style`**: Schriftschnitt (z. B. `normal`, `italic`)

####Textformatierung:  
- **`text-transform`**: Gross-/Kleinschreibung (z. B. `uppercase`, `capitalize`)  
- **`text-decoration`**: Dekoration wie Unterstreichung (z. B. `underline`, `none`)  
- **`line-height`**: Zeilenhöhe  
- **`letter-spacing`**: Abstand zwischen Buchstaben  
- **`word-spacing`**: Abstand zwischen Wörtern  
- **`text-align`**: Horizontale Ausrichtung (z. B. `left`, `center`, `right`)  
- **`text-indent`**: Einrückung des Textes  
- **`text-shadow`**: Schatteneffekt für Text

```css
p {
    font-family: "Verdana", sans-serif;
    font-size: 16px;
    font-weight: normal;
    text-align: justify;
    line-height: 1.5;
    text-shadow: 1px 1px 2px gray;
}
```

---

####Masseinheiten  
- **Pixel (px):**    
    Absolut; abhängig von der Pixeldichte des Ausgabegeräts.  
- **Prozent (%):**  
    Relativ; bezieht sich auf das übergeordnete Element oder einen anderen Kontext.  
- **EM (em):**  
    Relativ zur Schriftgrösse des aktuellen Elements; nützlich für skalierbare Layouts.  
- **REM (rem):**  
    Relativ zur Schriftgrösse des Root-Elements (`<html>`); vereinfacht konsistente Skalierung.   

```css
.container {
    width: 80%;           /* 80% der Breite des übergeordneten Elements */
    padding: 1em;       /* 1x der aktuellen Schriftgröße */
    font-size: 1rem;     /* entspricht der Schriftgröße des Root-Elements */
}
```

---


###Pseudo-Klassen
Wählen Elemente basierend auf ihrem Zustand oder ihrer Position aus.

####Interaktions-/Zustands-Pseudoklassen (basieren auf Nutzerinteraktion oder Link-Zustand)

| **Selektor** | **Beschreibung**                                                                |
| ------------ | ------------------------------------------------------------------------------- |
| `:link`      | Ein **unbesuchter** Link.                                                       |
| `:visited`   | Ein **besuchter** Link.                                                         |
| `:hover`     | Ein Element, über dem sich der Mauszeiger befindet.                             |
| `:active`    | Ein Element, das gerade **aktiviert** wird (z. B. beim Mausklick).              |
| `:focus`     | Ein Element, das den **Fokus** hat (z. B. ein aktives Eingabefeld im Formular). |

####Struktur-Pseudoklassen (basieren auf Dokumentstruktur)

| **Selektor**      | **Beschreibung**                                                                                                             |
| :---------------- |:------------------------------------------------------------------------------------------- |
| `:root`           | Das Wurzelelement (typischerweise `<html>` in einem HTML-Dokument                       |
| `:empty`          |  Ein Element ohne Inhalt (keine Kinder, weder Text noch andere Elemente   |
| `:first-child`    | Das **erste** Kind eines Elternelement  |
| `:last-child`     | Das **letzte** Kind eines Elternelement       |                                           
| `:nth.child(n)`| Das | Das **n-te** Kind eines Elternelements    |
|`:nth-child(even)`|  Alle geraden Elemente |
|`:nth-child(odd)`  | Alle ungerade Elemente | 
| `:only-child`     | Wählt ein Element aus, das das einzige Kind seines Elternteils ist.  |
| `:first-of-type`  | Wählt das **erste** Element seines Typs innerhalb des Eltern-Elements  |
| `:last-of-type`   | Wählt das **letzte** Element seines Typs innerhalb des Eltern-Elements |
| `:nth-of-type(n)` | Wählt das n-te Element eines bestimmten Typs innerhalb des Eltern-Elements |
| `:only-of-type`   | Wählt ein Element aus, das das einzige Kind seines Elternteils ist. |

---

###Pseudoelemente  
Ermöglichen es, Teile eines Elements zu stylen, die nicht explizit im HTML vorhanden sind.

| **Selektor**     | **Selektiert**                                               |
|:---------------- |:------------------------------------------------------------ |
| `::first-letter` | Das erste Zeichen eines Elements                             |
| `::first-line`   | Die erste Zeile eines Elements                               |
| `::before`       | Generiert Inhalt vor dem eigentlichen Inhalt eines Elements  |
| `::after`        | Generiert Inhalt nach dem eigentlichen Inhalt eines Elements |

```css
p::first-letter {
    font-size: 200%;
    color: red;
}
```

---

###Attributselektoren
Wählen Elemente basierend auf dem Vorhandensein oder dem Wert eines Attributs.

```css
/* Alle Elemente, die ein Attribut "data-info" besitzen */
[data-info] {
    border: 1px solid blue;
}

/* Elemente, deren "type"-Attribut mit "text" beginnt */
input[type^="text"] {
    background-color: #f0f0f0;
}

/* Elemente, deren "attr"-Wert exakt "wert" entspricht */
[attr="wert"] {
    font-weight: bold;
}
```

**Weitere Varianten:**  
| **Selektor**     | **Beschreibung**                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `[attr]`         | Wählt alle Elemente aus, die das Attribut `attr` besitzen.                                                                |
| `[attr="wert"]`  | Wählt Elemente, deren `attr`-Wert exakt **"wert"** entspricht.                                                            |
| `[attr^="wert"]` | Wählt Elemente, deren `attr`-Wert **mit "wert" beginnt**.                                                                 |
| `[attr$="wert"]` | Wählt Elemente, deren `attr`-Wert **mit "wert" endet**.                                                                   |
| `[attr*="wert"]` | Wählt Elemente, deren `attr`-Wert **"wert" enthält**.                                                                     |
| `[attr~="wert"]` | Wählt Elemente, deren `attr`-Wert **"wert" als isoliertes Wort** (d.h. als ganzes, durch Leerzeichen abgegrenzt) enthält. |


---

###Open Fonts einbinden und anwenden

####Mit `<link>` im HTML  
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Webfont Beispiel</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
</head>
<body>
    <h1>Hallo Welt</h1>
</body>
</html>
```

####Mit `@import` im CSS  
```css
@import url('https://fonts.googleapis.com/css?family=Roboto');
```

####Anwendung der Web Fonts mittels CSS
```css
body {
    font-family: 'Roboto', sans-serif;
}

```

---

# Box Modell & Gestaltung von Listen Tabellen und Formularen
![[Css für Listen, Tabellen und das Box-Modell.pdf]]
## 1. Box-Modell und Abstände

### 1.1 Das klassische Box-Modell

- **Grundidee:**  
    Jedes HTML-Element wird als rechteckige Box dargestellt. Diese Box setzt sich zusammen aus:
    - **Inhaltsbereich:** Der eigentliche Inhalt (Text, Bilder, etc.)
    - **Innenabstand (Padding):** Abstand zwischen Inhalt und Rahmen (border)
    - **Rahmen (Border):** Umrandung des Elements
    - **Außenabstand (Margin):** Abstand zwischen dem Element und benachbarten Elementen
- **Berechnung der tatsächlichen Größe:**  
    Die Gesamtabmessungen einer Box ergeben sich aus:
    - **Breite:** `width` + `padding-left` + `padding-right` + `border-left` + `border-right` + `margin-left` + `margin-right`
    - **Höhe:** `height` + `padding-top` + `padding-bottom` + `border-top` + `border-bottom` + `margin-top` + `margin-bottom`
- **Besondere Eigenschaften:**
    - **Collapsing Margins:** 
     Vertikale Außenabstände, die sich berühren, fallen zusammen (größter Wert).
    - **Overflow:** 
      Bestimmt, wie mit überlaufendem Inhalt umgegangen wird (z. B. `scroll`, `hidden`, `visible`, `auto`).


### 1.2 Das alternative Box-Modell (CSS3)

- **box-sizing: border-box;**  
    Mit dieser Eigenschaft wird die festgelegte Breite und Höhe einer Box inklusive Padding und Border festgelegt. Somit werden Innenabstände und Rahmen von der definierten Gesamtgröße abgezogen. Außenabstände (margin) bleiben davon unberührt.
    
- **Beispiel:**
```css
/* Standardverhalten: content-box (Default)
   - content-box: Die festgelegte Breite gilt ausschließlich für den Inhalt.
     Padding und Border werden zur Gesamtbreite hinzugerechnet.
   - Beispiel:
     Content Width: 300px
     Padding: 20px links + 20px rechts
     Border: 5px links + 5px rechts
     => Gesamtbreite = 300px + 40px + 10px = 350px
*/
.box-content {
    /* box-sizing: content-box (Default, falls nicht anders definiert) */
    width: 300px;  /* Content-Breite = 300px */
    padding: 20px;
    border: 5px solid blue;
}

/* Alternative: border-box
   - border-box: Die festgelegte Breite umfasst Inhalt, Padding und Border.
     Dadurch wird die eigentliche Content-Breite automatisch kleiner, damit die Gesamtbreite 300px beträgt.
   - Beispiel:
     Gesamtbreite = 300px
     Padding: 20px links + 20px rechts (40px insgesamt)
     Border: 5px links + 5px rechts (10px insgesamt)
     => Content Width = 300px - 40px - 10px = 250px
*/
.box-border {
    box-sizing: border-box;  /* Hier wird das neue Box-Modell aktiviert */
    width: 300px;  /* Border-box Breite = 300px (inklusive Padding und Border) */
    padding: 20px;
    border: 5px solid blue;
}

```
    

### 1.3 Übersicht: Wichtige Eigenschaften im Box-Modell

|Eigenschaft|Beschreibung|Beispielwerte|
|---|---|---|
|width / height|Breite/Höhe des Inhaltsbereichs|`400px`, `75%`|
|padding|Innenabstand (alle Seiten, oder individuell: top, right, bottom, left)|`10px`, `10px 5px`|
|border|Rahmen (Breite, Stil, Farbe – alle Seiten oder individuell)|`5px solid blue`|
|margin|Außenabstand (alle Seiten, oder individuell)|`20px`, `10px 5px`|
|min-/max-width/height|Mindest-/Maximalwerte für Breite/Höhe|`min-width:200px;`|
|overflow|Umgang mit überlaufendem Inhalt|`scroll`, `hidden`, `auto`|

---
## 2. Listen mit CSS gestalten

### 2.1 Standardlisten und deren Eigenschaften

- **Ungeordnete Listen (`<ul>`):**  
    Standardmäßig werden Aufzählungszeichen (bullet points) angezeigt.
    - **list-style-type:** Ändert das Aussehen der Aufzählungszeichen (z. B. `disc`, `circle`, `square`, `none`).
    - **list-style-image:** Ersetzt Aufzählungszeichen durch ein Bild.
    - **list-style-position:** Bestimmt, ob das Zeichen innerhalb oder außerhalb des Listen-Containers steht.
- **Geordnete Listen (`<ol>`):**  
    Werden nummeriert.
    - **list-style-type:** Bestimmt das Nummerierungssystem (z. B. `decimal`, `decimal-leading-zero`, `lower-alpha`, `upper-roman`).

### 2.2 Beispiel-Tabelle: Wichtige CSS-Eigenschaften für Listen

| Eigenschaft         | Beschreibung                                       | Beispielwert                       |
| ------------------- | -------------------------------------------------- | ---------------------------------- |
| list-style-type     | Art der Aufzählungszeichen bzw. Nummerierung       | `disc`, `circle`, `square`, `none` |
| list-style-image    | Bild als Aufzählungszeichen                        | `url("bullet.png")`                |
| list-style-position | Position der Aufzählungszeichen (inside / outside) | `inside` oder `outside`            |

### 2.3 Gestaltung von verschachtelten Listen
- **Hover-Effekte:**  
    Beispiel: Äußere Listenelemente werden beim Überfahren rot, innere (Inline-)Liste gelb.
```css
ul li:hover {
    background-color: red;
}
ul li ul li:hover {
    background-color: yellow;
}
```
    
- **Navigation:**  
    Listen werden häufig als Grundlage für Navigationsmenüs (vertikal, horizontal oder als Dropdown) genutzt.

---

## 3. Tabellen mit CSS gestalten

### 3.1 Grundlegende Tabellenformatierung

- **Grundstruktur:**  
    Eine Tabelle wird mit `<table>`, `<tr>` (Zeile) und `<td>` (Zelle) bzw. `<th>` (Headerzelle) erstellt.
- **Rahmen und Abstände:**
    - **border, border-collapse, border-spacing:** Bestimmen Rahmen und Abstände zwischen Zellen.
    - **empty-cells:** Steuert, ob leere Zellen angezeigt werden sollen.

### 3.2 Beispiel-Tabelle: Wichtige CSS-Eigenschaften für Tabellen

| Eigenschaft      | Beschreibung                                           | Beispielwert               |
| ---------------- | ------------------------------------------------------ | -------------------------- |
| border           | Rahmen der Tabelle (auch über CSS oder HTML-Attribut)  | `1px solid #000`           |
| border-collapse  | Zusammenfallen der Zellrahmen (Collapse vs. Separate)  | `collapse` oder `separate` |
| border-spacing   | Abstand zwischen den Zellen (nur bei separate borders) | `5px 10px`                 |
| padding          | Innenabstand innerhalb der Zellen                      | `7px 10px`                 |
| text-align       | Textausrichtung in Zellen                              | `left`, `center`, `right`  |
| background-color | Hintergrundfarbe der Zellen oder Zeilen                | `#efefef`, `#c3e6e5`       |

### 3.3 Beispiele für Tabellen mit Hover-Effekten

- **Zeilen-Hover:**
```css
tr:hover {
    background-color: red;
}
```

    
- **Zellen-Hover (im Tabellenkörper):**
```css
tbody td:hover {
    background-color: green;
}
```

---

## 4. Formulare mit CSS gestalten

### 4.1 Grundlegende Formularelemente

- **Container:**  
    Das `<form>`-Element fasst alle Steuerelemente zusammen.
- **Typische Steuerelemente:**  
	- `<input>`
	- `<textarea>`
	- `<select>`
	- `<button>`
	- `<label>`
	- `<fieldset>`
	- `<legend>`

### 4.2 Styling von Formularelementen

- **Textfelder, Buttons, und Dropdowns:**
    - **Breiten und Höhen:** Mit `width`, `height` sowie relativen Einheiten (`em`, `%`).
    - **Padding und Margin:** Zum Festlegen von Innen- und Außenabständen.
    - **Hover-Effekte:** Für interaktive Rückmeldungen (z. B. Hintergrundfarbe ändern, Schatten hinzufügen).
    - **Validation-Effekte:** Mit Pseudoklassen wie `:required`, `:valid` zur Darstellung von Pflichtfeldern (z. B. rotes Kreuz, grüner Haken).

### 4.3 Beispiel: Formular mit CSS-Hover und Validierungseffekten
```html
<form id="myForm" method="post">
  <fieldset>
    <legend>Feedback-Formular</legend>
    <div>
      <label for="name">Name:</label>
      <input type="text" name="name" id="name" placeholder="Ihr Name">
    </div>
    <div>
      <label for="mail">E-Mail:</label>
      <input type="email" name="mail" id="mail" placeholder="E-Mail-Adresse" required>
    </div>
    <div>
      <label for="message">Nachricht:</label>
      <textarea id="message" name="message" placeholder="Ihre Nachricht..." rows="5" required></textarea>
    </div>
  </fieldset>
  <button type="submit">Absenden</button>
</form>
```

```css
/* Allgemeines Formular-Styling */
form {
    max-width: 500px;
    margin: 0 auto;
    padding: 1em;
    background: #f9f9f9;
    border: 1px solid #ddd;
}

label {
    display: inline-block;
    width: 6em;
    text-align: right;
    margin-right: 1em;
}

input, textarea {
    width: calc(100% - 9em);
    padding: 0.5em;
    border: 1px solid #ccc;
}

input[type="checkbox"],
input[type="radio"] {
    width: auto;
}

/* Hover-Effekte für Eingabefelder */
input:hover, textarea:hover {
    background-color: #fffff0;
    border-color: #efe816;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
}

/* Validierungseffekte */
input:required:invalid, textarea:required:invalid {
    border-color: red;
}
input:required:valid, textarea:required:valid {
    border-color: green;
}
```
#CSS - Responsive Web Design

###Grundlagen des Responsive Web Designs
Gestaltung von Webseiten, die sich flexibel an verschiedene Bildschirmgrössen anpassen.  

####Wichtige Konzepte  
- **Mobile First:** Beginne mit einem Design für kleine Geräte und erweitere es mit Media Queries für grössere Viewports.  
- **Progressive Enhancement:** Inhalte stehen im Vordergrund; zusätzliche Styles werden für leistungsfähigere Browser ergänzt.  
- **Graceful Degradation:** Entwickle für moderne Systeme und passe dann für ältere Geräte an.

####Viewport & Pixel  
- **Visueller Viewport:** Der sichtbare Bereich des Browsers.  
- **Layout-Viewport:** Bezugsgrösse für CSS (z. B. standardmässig 980px in manchen mobilen Browsern).  
    
####Viewport-Meta-Tag  
```html
<!-- Legt fest, wie die Seite auf mobilen Geräten skaliert wird. --> 
<meta name="viewport" content="width=device-width" initial-scale=1.0">
```

---

###Media Queries
Mit Media Queries kannst du gezielt CSS-Regeln für bestimmte Bildschirmgrössen definieren.

```css
@media only screen and (min-width: 320px) {
    /* Regeln für Viewports ab 320px und grösser */
}

@media only screen and (max-width: 640px) {
    /* Regeln für Viewports bis  640px und kleiner */
}

@media only screen and (min-width: 640px) and (max-width: 1028px) {
    /* Regeln von mind 640px bis maximum 1028px
}

```

####Einheiten:  
Verwende vorzugsweise em statt px, damit Breakpoints auch bei Zoomanpassungen konsistent bleiben.  
 _Beispiel:_ 320px ≈ 20em (bei 16px Basis).
    
####Ansätze:  
- **Mobile First:** Standardregeln gelten für kleine Geräte; mit `min-width` erweiterst du das Layout.  
- **Desktop First:** Standardregeln gelten für große Geräte; mit `max-width` passt du das Layout für kleinere Viewports an.  

**Beispiel:**  
```css
body { background-color: blue; }

@media only screen and (min-width: 20em) {
    body { background-color: orange; }
}
@media only screen and (min-width: 40em) {
    body { background-color: red; }
}
@media only screen and (min-width: 50em) {
    body { background-color: yellow; }
}

```

---

###Responsive Layouts

####Layout-Varianten
| **Layout-Typ**| **Beschreibung**|
|:--------------|:--------|
| **Feste Layouts (Fixed)** | Verwenden pixelbasierte Masse, bieten exakte Kontrolle, sind aber wenig flexibel. |
| **Fluide Layouts (Fluid)** | Nutzen prozentuale Masse, um sich dynamisch an die Fenstergrösse anzupassen. |
| **Elastische Layouts (Elastic)** | Verwenden `em` oder `rem`, wodurch sie mit der Schriftgrösse skalieren. |
| **Adaptive Layouts** | Definieren verschiedene Layout-Versionen für festgelegte Breakpoints. |
| **Responsive Layouts** | Kombinieren fluide und adaptive Ansätze, oft mit Media Queries, Flexbox oder CSS Grid. |
    

####Responsive Layout Patterns
| Muster                | Beschreibung |
|:--------------|:--------------------|
| **Tiny Tweaks**    | Einspaltiges, fluides Layout mit minimalen Anpassungen. |
| **Mostly Fluid**   | Mehrspaltiges Layout, bei dem die Spalten flexibel verteilt werden. |
| **Column Drop**    | Bei kleineren Viewports werden Spalten untereinander statt nebeneinander angeordnet. |
| **Layout Shifter**  | Elemente werden je nach Breakpoint neu angeordnet (z. B. via Flexbox oder Grid). |

---

###CSS Grid – Detaillierte Responsive Techniken
CSS Grid ist ein leistungsstarkes 2D-Layoutsystem, das dir ermöglicht, komplexe Rasterlayouts zu erstellen, die sich problemlos an unterschiedliche Viewport-Grössen anpassen.

- Ein Element mit `display: grid;` wird zum Raster, in dem alle direkten Kinder Grid-Items sind.  
- **grid-template-columns / grid-template-rows:**  Definieren die Spalten- bzw. Zeilengrössen.

**Beispiel**  
```css
.grid-container{
	display: grid;
	grid-template-columns: repeat(3, 1fr); /*Drei gleich breite Spalten*/
	grid-template-row: auto auto; /* Zwei Zeilen, die sich automatisch an die Höhe des Inhalts anpassen */
}
```

#####repeat() & minmax()      
```css
/* 
repeat(3): wiederholt das Spaltenmuster 3-mal 
minmax(100px, 1fr): Spalte ist mind. 100px breit und max. so groß wie 1fr 
*/
.grid-container{
	display: grod;
	grid-template-columns: repeat(3, minmax(100px, 1fr));
}
```
#####gap    
```css
/*
Legt den Abstand zwischen den Grid-Items fest.
*/
.grid-container{
	gap: 1em;
}
```

####Platzierung von Grid-Items
Mit `grid-column` und `grid-row` kannst du Items über mehrere Spalten/Zeilen spannen.

#####Grid-Line-Notation
```css
.item{
/* 
    - Start bei Gitterlinie 2 
    - Belegt 2 Spalten (relative Endposition durch "span 2")
*/
	grid-column: 2 / span 2;
	
/* 
    - Start bei Gitterlinie 1 
    - Endet an Gitterlinie 3 (belegt 2 Zeilen)
*/
	grid-row: 1 / 3;
}
```

#####Benennung von Grid-Lines
```css
/*
-----------------------------------------------------------------------------
Beispiel Bennenung für Spalten (Columns)
-----------------------------------------------------------------------------
*/

.grid-container {
  display: grid;
  /* Definiert ein Grid mit 4 Spalten und benennt die Linien */
  grid-template-columns:
    [start] 1fr
    [col2-start] 1fr
    [col3-start] 1fr
    [col4-start] 1fr
    [end];
  gap: 10px;
}

/* Items platzieren anhand benannter Linien */
.item1 {
  /* Nimmt die ersten beiden Spalten ein (von "start" bis "col3-start") */
  grid-column: start / col3-start;
  background-color: #fdd;
  padding: 10px;
}
.item2 {
  /* Nimmt die letzten beiden Spalten ein (von "col3-start" bis "end") */
  grid-column: col3-start / end;
  background-color: #dfd;
  padding: 10px;
}
.item3 {
  /* Nimmt die mittleren beiden Spalten ein (von "col2-start" bis "col4-start") */
  grid-column: col2-start / col4-start;
  background-color: #ddf;
  padding: 10px;
}

/*
-----------------------------------------------------------------------------
Beispiel Bennenung für Zeilen (Rows) 
-----------------------------------------------------------------------------
*/

.grid-container-rows {
  display: grid;
  /* Definiert ein Grid mit 4 Zeilen und benennt die Zeilenlinien */
  grid-template-rows: 
    [row1-start] auto 
    [row2-start] auto 
    [row3-start] auto 
    [row-end];
  gap: 10px;
  border: 2px solid #333;
}

/*
---------------------------------------------------------------------------- 
Beispiel Positionierung eines Items anhand der benannten Zeilenlinien 
----------------------------------------------------------------------------
*/

.item-rows {
  /* Spannt von "row1-start" bis "row3-start" – also über zwei Zeilen */
  grid-row: row1-start / row3-start;
  padding: 10px;
  background-color: #ddf;
}
```

#####Grid Template Areas  
 Benenne Bereiche im Grid und ordne Items diesen zu.  

```css
.grid-container{
	grid-template-areas:
	"header header header"
	"nav content sidebar"
	"footer footer footer";
}
/*Reihenfolge spielt hier keine Rolle */
header { grid-area: header; }
nav { grid-area: nav; }
main { grid-area: content; }
aside { grid-area: sidebar; }
footer { grid-area: footer; }

```

#####Auto-Placement:  
Mit `grid-auto-rows` und `grid-auto-columns` werden automatisch zusätzliche Zeilen/Spalten erstellt.  

```css
.grid-container{
/* 
    - Zusätzliche Zeilen werden automatisch erstellt, 
      wenn mehr Elemente vorhanden sind als vorgegeben.
    - Jede extra Zeile hat eine Höhe von 150px.
*/
	grid-auto-rows: 150px;
}
```    

####Responsive CSS Grid

#####Medienabfragen  
Passe die Grid-Definition an unterschiedliche Viewport-Grössen an.  
```css
.grid-container {
    grid-template-columns: 1fr;
}
@media only screen and (min-width: 40em) {
    /* Ab ca. 640px: Dreispaltiges Layout */
    .grid-container {
        grid-template-columns: repeat(3, 1fr);
    }
}
```

#####Flexible Einheiten:  
Verwende `fr` (Fractional Unit) für proportional verteilte Spalten.  
```css
.grid-container {
    grid-template-columns: 1fr 2fr 1fr; /* Mittlere Spalte erhält doppelt so viel Platz */
}
```

####Wichtige Grid Properties

#####Grid-Container Properties
| **Property**              | **Beschreibung**                                                                                                       |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **display: grid;**        | Setzt das Element als Grid-Container.                                                                                  |
| **grid-template-columns** | Definiert die expliziten Spalten des Grids (Größenangaben, z. B. mit repeat() oder minmax()).                          |
| **grid-template-rows**    | Definiert die expliziten Zeilen des Grids.                                                                             |
| **grid-template-areas**   | Ermöglicht das Benennen von Rasterbereichen, in die Grid-Items platziert werden können.                                |
| **grid-auto-columns**     | Legt die Größe von automatisch erstellten Spalten fest, wenn Items über die definierten Spalten hinausgehen.           |
| **grid-auto-rows**        | Legt die Größe von automatisch erstellten Zeilen fest, wenn Items über die definierten Zeilen hinausgehen.             |
| **grid-auto-flow**        | Bestimmt die automatische Platzierung von Grid-Items (z. B. ob zuerst Zeilen oder Spalten gefüllt werden; dense mode). |
| **gap (grid-gap)**        | Definiert den Abstand zwischen den Grid-Items (Kurzform für row-gap und column-gap).                                   |
| **row-gap**               | Legt den vertikalen Abstand zwischen den Zeilen fest.                                                                  |
| **column-gap**            | Legt den horizontalen Abstand zwischen den Spalten fest.                                                               |
| **align-items**           | Bestimmt die vertikale Ausrichtung der Grid-Items innerhalb ihrer Zellen.                                              |
| **justify-items**         | Bestimmt die horizontale Ausrichtung der Grid-Items innerhalb ihrer Zellen.                                            |
| **align-content**         | Richtet den gesamten Grid-Inhalt vertikal aus, wenn zusätzlicher Platz vorhanden ist.                                  |
| **justify-content**       | Richtet den gesamten Grid-Inhalt horizontal aus, wenn zusätzlicher Platz vorhanden ist.                                |
| **place-items**           | Shorthand für align-items und justify-items.                                                                           |
| **place-content**         | Shorthand für align-content und justify-content.                                                                       |


#####Grid-Item Properties
|**Property**|**Beschreibung**|
|:---------|:------|
|**grid-column-start**|Gibt die Startlinie der Spalte an, in der das Item platziert wird.|
|**grid-column-end**|Gibt die Endlinie der Spalte an, bis zu der das Item reicht.|
|**grid-column**|Shorthand für grid-column-start und grid-column-end.|
|**grid-row-start**|Gibt die Startlinie der Zeile an, in der das Item platziert wird.|
|**grid-row-end**|Gibt die Endlinie der Zeile an, bis zu der das Item reicht.|
|**grid-row**|Shorthand für grid-row-start und grid-row-end.|
|**grid-area**|Kann als Shorthand für die vier Grid-Linien (row start, column start, row end, column end) genutzt werden oder um auf einen benannten Grid-Bereich zu verweisen.|
|**align-self**|Überschreibt die Standard-Ausrichtung (align-items) des Containers für das einzelne Item (vertikal).|
|**justify-self**|Überschreibt die Standard-Ausrichtung (justify-items) des Containers für das einzelne Item (horizontal).|
|**place-self**|Shorthand für align-self und justify-self.|
|**order**|Legt die Reihenfolge der auto-platzierten Grid-Items fest (beeinflusst die automatische Platzierung).|
|**z-index**|Steuert die Stapelreihenfolge bei überlappenden Grid-Items.|


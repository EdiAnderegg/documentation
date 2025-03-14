#CSS - Layoutgestaltung


###Normaler Fluss
Standardmässig werden Blockelemente untereinander im Dokumentfluss angeordnet.

```html
<div>
  <h1>Überschrift</h1>
  <p>Absatz 1</p>
  <p>Absatz 2</p>
</div>
```

###Relative, absolute & feste Positionierung

####Relative Positionierung:    
Ein Element wird relativ zu seiner Normalposition verschoben.  

```css
.relativ {
    position: relative;
    top: 10px;
    left: 50px;
}
```

####Absolute Positionierung:   
Ein Element wird aus dem Dokumentfluss herausgenommen und relativ zu seinem nächsten positionierten Vorfahren platziert.

```css
.absolut {
    position: absolute;
    top: 20px;
    left: 100px;
}

```

####Feste Positionierung:    
Ein Element wird relativ zum Viewport fixiert und bleibt beim Scrollen an derselben Stelle.

```css
.fixed {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: rgba(0,0,0,0.8);
}
```

---

###Float, Clear & Clearfix-Hacks

####Float  
Mit `float: left;` oder `float: right;` werden Elemente aus dem normalen Fluss herausgenommen und nebeneinander angeordnet.

```css
.float-left {
    float: left;
    width: 230px;
    margin: 5px;
    padding: 5px;
    background-color: #efefef;
}

```

####Clear
Verhindert, dass nachfolgende Elemente an schwimmenden Elementen "anhaften".

```css
.clear {
    clear: both; /* oder clear: left; bzw. right; */
}
```

####Clearfix-Hack  
Um Container korrekt um schwimmende Elemente zu legen, ohne dass deren Höhe zusammenfällt.

```css
.clearfix {
    overflow: auto; /* Für moderne Browser */
    zoom: 1; /* Für IE6/7 */
}
.clearfix::after {
    content: "";
    display: block;
    clear: both;
}
```

###Flexbox – Das neue Kastenlayout  
Mit Flexbox definierst du einen Container (mit `display: flex;`), in dem alle enthaltenen Elemente (Flex-Items) flexibel entlang einer Achse angeordnet werden. Flexbox löst viele Layout-Probleme, indem es die Verteilung von Raum und Ausrichtung der Items vereinfacht.

```html
<div class="flex-container">
    <div>Box 1</div>
    <div>Box 2</div>
    <div>Box 3</div>
    <div>Box 4</div>
</div>
```
```css
.flex-container {
    display: flex; /* Standardmässig in einer Zeile (flex-direction: row) angeordnet */
}
.flex-container > div {
    flex: 1; /* Alle Boxen teilen sich gleichmässig den verfügbaren Platz */
    padding: 10px;
    border: 1px solid #ccc;
}
```
####Besondere Eigenschaften der Flex-Items  
Flex-Items lassen sich über die Kurzform-Eigenschaft `flex` sowie die Einzelwerte **flex-grow**, **flex-shrink** und **flex-basis** steuern:

| **Eigenschaft** |  **Beschreibung** | **Beispiel** |
|:-----|:--------|:-------|
|`flex-grow: `| Bestimmt, wie viel ein Flex-Item im Verhältnis zu den anderen wachsen soll, wenn zusätzlicher Platz vorhanden ist.  **Standardwert: 0 (kein Wachstum)** | `flex-grow: 2;` – Dieses Item erhält doppelt so viel zusätzlichen Raum wie ein Item mit `flex-grow: 1;` |
|`flex-shrink: `| Legt fest, wie stark ein Flex-Item schrumpfen soll, wenn nicht genügend Platz vorhanden ist. **Standardwert: 1 (schrumpft, wenn nötig)** | `flex-shrink: 0;` – Das Item schrumpft nicht, selbst wenn der Container kleiner wird. |
|`flex-basis: `| Gibt die anfängliche Grösse eines Flex-Items entlang der Hauptachse an, bevor Wachstum oder Schrumpfung stattfindet.  **Standardwert:** `auto` (entspricht der natürlichen Grösse des Inhalts)   | `flex-basis: 100px;` – Das Item startet mit einer Breite von 100 Pixeln. |
|`flex`: | Kombiniert die drei Eigenschaften. | | 
    
```css
.item-2 {
    flex: 2 1 100px; /* flex-grow: 2, flex-shrink: 1, flex-basis: 100px */
}
```

####Container-Eigenschaften zur Steuerung des Layouts

| **Eigenschaft** | **Beschreibung** | **Werte** |
|:----------------|:----------|:----------|
| `flex-direction: ` | Legt die Richtung der Hauptachse fest. | `row`, `row-reverse`, `column`, `column-reverse` |
| `justify-content: ` | Bestimmt die Verteilung der Flex-Items entlang der Hauptachse. | `flex-start`, `flex-end`, `center`, `space-between`, `space-around` |
| `align-items: ` | Steuert die Ausrichtung der Items entlang der Querachse. | `flex-start`, `flex-end`, `center`, `baseline`, `stretch` |
| `flex-wrap: ` | Bestimmt, ob Flex-Items in einer Zeile bleiben oder umbrechen. | `nowrap`, `wrap`, `wrap-reverse` |
| `order: ` | Bestimmt die Reihenfolge der Flex-Items. | Numerische Werte (z.B. `1`, `2`, `-1`) |

```css

/* Dadurch wird das Item mit order: 1 vor dem mit order: 2 angezeigt. */

.item-1{
	order: 2;
}
.item-2{
	order: 1;
}
```

####Flexbox-Beispiel mit mehreren Eigenschaften

```html
<div class="flex-container">
    <div class="item-1">Box 1</div>
    <div class="item-2">Box 2</div>
    <div class="item-3">Box 3</div>
</div>
```
```css
.flex-container {
    display: flex;
    flex-direction: row;    /* Elemente werden horizontal angeordnet */
    justify-content: space-between;   /* Gleichmässiger Abstand zwischen den Boxen */
    align-items: center;   /* Vertikale Zentrierung der Boxen */
    flex-wrap: wrap;         /* Elemente umbrechen, wenn nicht genügend Platz vorhanden ist */
}

.item-1 {
    flex: 1 1 100px;  /* Grow: 1, Shrink: 1, Basis: 100px */
    order: 2;
}

.item-2 {
    flex: 2 1 100px;   /* Box 2 erhält doppelt so viel Wachstum */
    order: 1;
}

.item-3 {
    flex: 1 1 100px;
    order: 3;
}
```

---

###Mehrspaltige Layouts

####Feste Layouts (Fixed Layout)
- Masse werden in Pixeln angegeben.
- Layout verändert sich nicht mit der Fenstergrösse.

```html
<div id="container">
    <div class="column">Spalte 1</div>
    <div class="column">Spalte 2</div>
    <div class="column">Spalte 3</div>
</div>
```
```css
#container {
    width: 960px;
    margin: 0 auto;
}
.column {
    float: left;
    width: 300px;
    margin: 10px;
    padding: 10px;
    background-color: #efefef;
}
```

####Flüssige Layouts (Fluid Layout)
- Masse werden in Prozent angegeben.
- Layout passt sich der Fenstergrösse an.

```css
#container {
    width: 90%;
    margin: 0 auto;
}
.column {
    float: left;
    width: 31.3%;
    margin: 1%;
    padding: 0.5%;
}
```

####Elastische Layouts (Elastic Layout)
- Masse in `em` oder `rem` – skalieren mit der Schriftgrösse.

```css
body {
    font-size: 16px;
}
#container {
    width: 60em;
    margin: 0 auto;
}
.column {
    float: left;
    width: 31.3%;
    margin: 1%;
    padding: 0.5%;
}
```

####Adaptive / Responsive Layouts
- Kombination aus flexiblen Einheiten, Media Queries und ggf. CSS Grid / Flexbox.
- Das Layout wechselt je nach Bildschirmgrösse.

```css
.flex-container {
    display: flex;
    flex-wrap: wrap;
}
.flex-item {
    flex: 1 1 250px; /* Flexgrow, flexshrink, Basisbreite */
    margin: 10px;
}
```

---

###Boilerplate für Webprojekte

####HTML5 Boilerplate  
Ein Starter-Kit, das Best Practices, optimierte Dateistrukturen und Skripte bereitstellt.  
_(Download: [html5boilerplate.com](https://html5boilerplate.com))_
    
####Normalize.css  
Vereinheitlicht die Browser-Standardwerte, sodass ein konsistenter Ausgangspunkt vorhanden ist.    
_(Download: [necolas.github.io/normalize.css/](https://necolas.github.io/normalize.css/))_

Normalize.css ist ein pragmatischer Ansatz zur Standardisierung von Styles zwischen verschiedenen Browsern, ohne alle Standardwerte auf Null zu setzen.
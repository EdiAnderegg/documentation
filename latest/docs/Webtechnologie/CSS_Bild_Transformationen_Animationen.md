#CSS - Bilder, Transformationen, Übergänge und Animationen


###Bilder in Webseiten einbinden und dimensionieren

####HTML-Bildeinbindung

```html
<img src="pfad/zum/bild.jpg" alt="Beschreibung des Bildes">
```    
    
**Dimensionierung über HTML:**    
```html
<img src="pfad/zum/bild.jpg" alt="Bildbeschreibung" width="400" height="300">
```

####CSS-Dimensionierung von Bildern
Mit CSS lassen sich Bilder flexibel skalieren oder zentrieren.

```css

/* Das Bild passt sich der Breite des Containers an und behält dabei das Seitenverhältnis (height: auto). */

img.responsive {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto;
}
```

---

###Hintergrundbilder und Farbverläufe

####Hintergrundbilder in CSS

| Eigenschaft              | Beschreibung |
|:-------------------------|:------------|
| **background-image**     | Setzt ein oder mehrere Bilder als Hintergrund. |
| **background-repeat**    | Steuert die Wiederholung des Hintergrundbildes (`repeat`, `repeat-x`, `repeat-y`, `no-repeat`). |
| **background-size**      | Legt die Grösse des Hintergrundbildes fest (`auto`, `cover`, `contain`, konkrete Werte). |
| **background-position**  | Bestimmt, wo das Hintergrundbild positioniert wird (`left top`, `center center`, `right bottom` etc.). |
| **background-attachment** | Bestimmt, ob das Hintergrundbild scrollt oder fixiert ist (`scroll`, `fixed`, `local`). |
| **background-clip**      | Definiert, in welchem Bereich des Elements der Hintergrund sichtbar ist. |
| **border-box** (Standard) | Der Hintergrund wird bis zum Rand des Rahmens (border) gezeichnet. |
| **padding-box**          | Der Hintergrund reicht nur bis zum Innenabstand (padding) und schneidet den Rahmen aus. |
| **content-box**          | Der Hintergrund wird nur im Inhaltsbereich (Content) angezeigt. |

**Beispiel 1:**  
```css
body {
    background-color: #ffffff;
    background-image: url("pfad/zum/hintergrund.jpg");
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    background-size: cover; 
    background-clip: border-box; /* Standard: Hintergrund reicht bis zum Rand des Rahmens */
}
```
**Beispiel 2:**  
```css
/* 
Hintergrund: 
1. Hintergrundbild: img/fadenkreuz.png, keine Wiederholung, fixiert, oben rechts
2. Hintergrundbild: img/fadenkreuz.png, keine Wiederholung, fixiert, unten rechts
Nicht erwähnte Eigenschaften (z.B. background-color) übernehmen den Standard 
*/

body {
	background: url("img/fadenkreuz.png") no-repeat fixed top right,
	                     url("img/fadenkreuz.png") no-repeat fixed bottom right;
	                     margin: 0 200px 0 10px;
}
```

####Lineare Farbverläufe
Mit `linear-gradient` kann ein Farbverlauf erzeugt werden.

```css
background-image: linear-gradient(direction, color-stop1, color-stop2, ...);
```

**Beispiel:**  
```css

/* Der Verlauf verläuft horizontal (90deg) von Weiss zu deepskyblue. */

.gradient {
    background-image: linear-gradient(90deg, #fff, deepskyblue);
}
```

---

###Übergänge (Transitions)
Übergänge sorgen für sanfte, weiche Zustandswechsel, z. B. beim Hover über ein Element.

| Eigenschaft                 | Beschreibung |
|:------------------------|:------------|
| `transition-property: `      | Bestimmt, welche CSS-Eigenschaften animiert werden (`all`, einzelne Eigenschaften wie `opacity`, `background-color` etc.). |
| `transition-duration: `      | Gibt die Dauer der Animation an (`0.5s`, `1s`, `200ms`). |
| `transition-timing-function: `  | Definiert das Beschleunigungsprofil der Animation (`ease`, `linear`, `ease-in`, `ease-out`, `ease-in-out`). |
| `transition-delay: `          | Legt eine Verzögerung vor Beginn der Animation fest (`0.2s`, `1s`). |


**Beispiel:**  
```css
.btn {
    background-color: blue;
    transition: background-color 0.5s ease;
}
.btn:hover {
    background-color: darkblue;
}

```

---

###Animationen  
Animationen können komplexe, mehrstufige Bewegungen und Effekte erzeugen.

| Eigenschaft                  | Beschreibung |
|:----------------------------|:------------|
| **@keyframes**               | Definiert die einzelnen Schritte (Wegpunkte) einer Animation. |
| **animation-name**           | Verweist auf den Namen der `@keyframes`-Regel. |
| **animation-duration**       | Gibt die Gesamtdauer der Animation an (`1s`, `2s`, etc.). |
| **animation-timing-function** | Bestimmt das Beschleunigungsprofil (`ease`, `linear`, `ease-in`, `ease-out`, `ease-in-out`). |
| **animation-delay**          | Legt eine Verzögerung vor Start der Animation fest (`0.5s`, `1s`). |
| **animation-iteration-count** | Gibt die Anzahl der Wiederholungen an (`1`, `3`, `infinite`). |
| **animation-direction**      | Bestimmt die Animationsrichtung (`normal`, `reverse`, `alternate`, `alternate-reverse`). |
| **animation-fill-mode**      | Definiert, wie sich das Element nach der Animation verhält (`none`, `forwards`, `backwards`, `both`). |

**Beispiel:**  
```css

/* Beim Hover über den Container wird die Hintergrundfarbe von Rot zu Weiß über 3 Sekunden animiert. */

#box {
    width: 400px;
    height: 200px;
    background-color: red;
    text-align: center;
    padding-top: 90px;
    color: white;
    margin: 0 auto;
}
#box:hover {
    animation: red-to-white 3s linear forwards;
}
@keyframes red-to-white {
    0% {
        background-color: rgb(255, 0, 0);
    }
    100% {
        background-color: rgb(255, 255, 255);
    }
}

```

---

###Kombination von Transformationen, Übergängen und Animationen

####Transformationen:  
Mit `transform` können Elemente skaliert, rotiert, verschoben oder geneigt werden.  
- **scale(), rotate(), skew(), translate()**  

**Beispiel:**  
```css
.transform:hover {
    transform: scale(1.2) rotate(10deg) translate(20px, 10px);
}

```

####Kombination mit Transition:  
Übergänge lassen die Transformation sanft erfolgen.

```css
.transform {
    transition: transform 0.5s ease, opacity 0.5s ease;
}
.transform:hover {
    transform: scale(1.2);
    opacity: 0.8;
}
```
---

###Sprites
Mehrere Icons/Button-Zustände in einer Bilddatei; Ausschnitte werden via `background-position` angezeigt.  
- **Vorteil:** Weniger HTTP-Anfragen, bessere Performance.

**Beispiel:  
  ```css
.button {
    display: inline-block;
    width: 125px; height: 40px;
    background: url("sprite.png") no-repeat;
}
.button:hover {
    background-position: 0 -40px; /* anderer Ausschnitt */
}
```

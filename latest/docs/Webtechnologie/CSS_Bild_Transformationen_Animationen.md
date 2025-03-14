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

### 2.3 Lineare Farbverläufe

- **Syntax:**  
    Mit `linear-gradient` kann ein Farbverlauf erzeugt werden.
```css
background-image: linear-gradient(direction, color-stop1, color-stop2, ...);
```

- **Beispiel:**
```css
.gradient {
    background-image: linear-gradient(90deg, #fff, deepskyblue);
}
```
_Erklärung:_ Der Verlauf verläuft horizontal (90deg) von Weiß zu deepskyblue.

---

## 3. Übergänge und Animationen

### 3.1 Übergänge (Transitions)

- **Zweck:**  
    Übergänge sorgen für sanfte, weiche Zustandswechsel, z. B. beim Hover über ein Element.
- **Wichtige Eigenschaften:**
    - **transition-property:** Welche Eigenschaft(en) animiert werden sollen (z. B. `all` oder einzelne Eigenschaften)
    - **transition-duration:** Dauer des Übergangs (z. B. `0.5s`, `1s`)
    - **transition-timing-function:** Beschleunigungsprofil (z. B. `ease`, `linear`, `ease-in`, `ease-out`, `ease-in-out`)
    - **transition-delay:** Verzögerung vor Beginn des Übergangs (z. B. `0.2s`)
- **Beispiel:**
```css
.btn {
    background-color: blue;
    transition: background-color 0.5s ease;
}
.btn:hover {
    background-color: darkblue;
}

```

### 3.2 Animationen
- **Zweck:**  
    Animationen können komplexe, mehrstufige Bewegungen und Effekte erzeugen.
- **Wichtige Eigenschaften:**
    - **@keyframes:** Definiert die einzelnen Schritte (Wegpunkte) der Animation.
    - **animation-name:** Verweist auf den Namen der @keyframes-Regel.
    - **animation-duration:** Gesamtdauer der Animation.
    - **animation-timing-function:** Beschleunigungsprofil der Animation.
    - **animation-delay:** Verzögerung vor Start der Animation.
    - **animation-iteration-count:** Anzahl der Wiederholungen (z. B. `infinite`).
    - **animation-direction:** Animationsrichtung (z. B. `normal`, `reverse`).
    - **animation-fill-mode:** Bestimmt, wie sich das Element nach der Animation verhält (z. B. `forwards`).
- **Ein einfaches Beispiel:**
```css
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
_Erklärung:_ Beim Hover über den Container wird die Hintergrundfarbe von Rot zu Weiß über 3 Sekunden animiert.

### 3.3 Kombination von Transformationen, Übergängen und Animationen

- **Transformationen:**  
    Mit `transform` können Elemente skaliert, rotiert, verschoben oder geneigt werden.
    - **scale(), rotate(), skew(), translate()**  
        _Beispiel:_
```css
.transform:hover {
    transform: scale(1.2) rotate(10deg) translate(20px, 10px);
}

```
- **Kombination mit Transition:**  
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
### 3.4 Sprites
- **Konzept:** Mehrere Icons/Button-Zustände in einer Bilddatei; Ausschnitte werden via `background-position` angezeigt.
- **Vorteil:** Weniger HTTP-Anfragen, bessere Performance.
- **Beispiel (Hover-Zustände):**

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

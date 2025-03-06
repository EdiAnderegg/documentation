#Die Sprache

**Die Sprache im allgemeinen Sinne ist wahrscheinlich eines der wichtigsten Mittel des Menschen zur Sammlung von Informationen und vor allem zur Weitergabe von Informationen an andere in verständlicher und strukturierter Form.**  

**Ist die Sprache eine der ersten Normen, die der Mensch entwickelt hat?**

Wie in jedem Beruf gibt es auch im IT-Bereich eine Sprache!
Die Informatik hat sich in den letzten Jahrzehnten rasant entwickelt und ist zu einem grundlegenden und wichtigen Bestandteil des täglichen Lebens geworden. 
Um mit der heutigen Komplexität der IT Schritt zu halten und sie unter Kontrolle zu behalten, hat sich die IT in klare Sektoren aufgeteilt. So hat jeder Sektor seine eigene Sprache weiterentwickelt, wie z.B. der Sektor der Softwareentwicklung!

---

###Code Konventionen
Codierungskonventionen dienen den folgenden Zwecken:  

- Sie sorgen für ein einheitliches Erscheinungsbild des Codes. Dadurch wird der Fokus auf den Inhalt gelenkt.  
- Sie ermöglichen, den Code Schneller zu verstehen, da Rückschlüsse basierend auf den bisherigen Erfahrungen gezogen werden können.  
- Sie erleichtern die Bearbeitung, Dokumentation und Speicherung des Codes.  

| Name der Bezeichnung | Schreibweise | Beispiel |
|:---|:---|:---|
|-  KlassenName <br> -  InterfaceName <br> -  EnumsName | -  PascalCase <br> - Singular | ```class DasIstEinAussagekraeftigerName{ }``` |
|-  MethodenName <br> -  PropertyName |-  PascalCase | ```public string BesserWennDerMethodenNameDieFunktionErklaert(){}``` |
|-  _klassenVariabeln |-  _camelCase | ```private string _ichWillNichtUnbedingt = "öffentlich sein"``` |
|-  lokaleVariabeln |-  camelCase | ```string ichHabeEinenOriginellenNamen = '"puff", zum Glück bin ich lokal'``` |

```cs

// Sortierreihenfolge

/*
  Hier sehen wir eine Klasse, 
  die übersichtlich angeordnet ist!


  Warum sind die Eigenschaften nach oben angeordnet ?
*/

public class CodeConvention 
{

   // Eigenschaften
   private int _classVariable = 0;

   // Konstruktor
   public CodeConvention() {}


   // Eigenschaftsmethoden / Accessors
   public string MyPublicProperty { get; set; }


   private string MyPrivateProperty { get; set; }

   
   // Methoden
   public void MyPublicMethod(){}

 
   private void MyPrivateMethod(){}
   
}
```

---

###Deklaration
Um sicherzustellen, dass genügend Speicherplatz für einen **Wert** reserviert ist, müssen Variablen deklariert werden.
Eine Deklaration legt fest, welche Art von Wert gespeichert werden soll und wie viel Platz für den Wert reserviert werden soll.
Dies wird mittels eines **Datentyps** erreicht.  

Nachdem eine Variable deklariert, indem der **Datentyp** sowie der **Bezeichner** gewählt wurden, kann der Speicher via dem Bezeichner beschrieben werden.
Dies gesschieht durch den **Zuweisungsoperator** =.

```cs
 // Die Deklaration einer Variablen
 
 /*
   DatenTyp: int
   Bezeichner: alter
   Zuweisungsoperator: =
   Wert: 35
 */

int alter;

alter = 35;

```

---

###Enumeration
Enumerationen erlauben es, **konstante Werte** bzw. unter einem eigenen Datentype zusammenzufassen!

*Als Analogie zu Enumeration kann man den Datentype bool hinzuziehen. Diesem sind auch nur zwei reservierte Namen zuzuweisen (`true` oder `false`).  
Intern kann der Compiler aber auch nicht mit diesen namenbasierenden Werten operieren, trotzdem stehen diese zur Vereinfachung zur Verfügung!*

```cs

enum Wochentag
{
    Montag,     // Standardmässig 0
    Dienstag,   // 1
    Mittwoch,   // 2
    Donnerstag, // 3
    Freitag,    // 4
    Samstag,    // 5
    Sonntag     // 6
}


/*
 Einem Enumerator explizit einen Wert zuweisen

enum Wochentag : int
{
    Montag = 1,     // 1
    Dienstag = 2,   // 2
    Mittwoch = 3,   // 3
    Donnerstag = 4, // 4
    Freitag = 5,    // 5
    Samstag = 6,    // 6
    Sonntag = 7     // 7
}
*/


// Enum-Wert zuweisen
Wochentag heute = Wochentag.Dienstag;  // Dienstag als Wert

// Umwandlung Enum → Zahl
int nummer = (int)heute;  // 1 als Wert

// Umwandlung Zahl → Enum
Wochentag tagVonNummer = (Wochentag)4;  // Freitag als Wert

```

---

###Exception Handling  
Das Exception Handling dient zum Abfangen von Laufzeitfehlern und dem Behandeln von Ausnahmen. Diese treten auf, wenn das Programm versucht, eine unzulässige Operation durchzuführen.
  
```cs

int value1 = Convert.ToInt16(TxtValue1.Text);           
int value2 = Convert.ToInt16(TxtValue2.Text);            

try
 {                
   double result = value1 / value2;                
   TxtResult.Text = Convert.ToString(result);           
}
catch (DivideByZeroException ex)            
{                
   MessageBox.Show("Division durch 0 nicht erlaubt", "Fehler!", 
   MessageBoxButtons.OK, MessageBoxIcon.Error);
}
```

Eine umfängliche Liste aller vorhandener Exceptions, welche die .Net Bibliothek aus dem Namensraum System mitbringt:
[Exception List](https://msdn.microsoft.com/en-us/library/system.systemexception(v=vs.110).aspx)

---


###Fehlerarten


####Syntaktischer Fehler
Dies sind Fehler, welche eine Verletzung der "Grammatik" der Sprache aufweisen.

```cs
int number = "Hello"; // ❌ Error: Cannot implicitly convert type 'string' to 'int'
```


####Laufzeitfehler 
( Runtime Error )  
Dies ist ein Fehler, der während der Ausführung eines Programms auftritt, nachdem es erfolgreich kompiliert wurde.

```cs
class Program
{
    static void Main()
    {
        int[] zahlen = { 1, 2, 3 };

        try
        {
            Console.WriteLine(zahlen[5]); // Fehler wird abgefangen
        }
        catch (IndexOutOfRangeException ex)
        {
            Console.WriteLine("Fehler: Zugriff außerhalb des gültigen Indexbereichs!");
        }
    }
}

```


####Logischer Fehler 
( semantischer Fehler )  

Der Code ist syntaktisch korrekt und die IDE (Integrated Development Environment) oder der Code-Editor melden keine Fehler. Erst wenn das Programm ausgeführt wird, liefert es unerwartet Ausgaben oder akzeptiert unerwartete Eingaben! 
```cs
class Program
{
    static void Main()
    {
        int x = 10;
        if (x > 10)
        {
            Console.WriteLine("x ist größer als 10");
        }
        else
        {
            Console.WriteLine("x ist kleiner als 10");
        }
    }
}
```

| **Arten** | **Beschreibung** |
|:------|:-------------|
|**Reproduzierbare logische Fehler** | Fehler, welcher in einer bestimmten Konstellation immmerwährend auftauchen und sich gleich immer auf identische Art und Weise zu erkennen geben. |
|**Sporadische logische Fehler** | Fehler, welche aufgrund komplexer Konstellationen nur ab und zu auftauchen und sich teilweise nicht immer auf die selbe Art und Weise zu erkennen geben. |

---

###Kapselung

Grundsätzlich sollten Eigenschaften einer Klasse immer den private Zugriffsmodifizierer besitzen. Man spricht hier von Datenkapselung. Die Datenkapselung ist eines der Schlüsselkonzepte der objektorientierten Programmierung. 

Auch können get und set entsprechende Zugriffsmodifizierer zugewiesen werden. Allerdings gelten hier bestimmte Regeln. Ein Modifizierer eines Accessors (get oder set) muss mindestens so restriktiv sein wie das Property (Eigenschaftsmethode) selbst. 

```cs
class Circle
{
   private int radius;

   public int Radius 
   {
      get { return radius; }
      private set
      {
          if(value>=0)
          radius=value;
      }
   }

}
```

####Auto-Property
Nicht selten werden Objekteigenschaften benötigt, ohne dass Code in set und get notwendig ist.

```cs
class Circle
{
   private int radius;

   public int Radius 
   {
      get { return radius; }
      private set
      {
          if(value>=0)
          radius=value;
      }
   }

   // Auto-Property
  
   public double XCoordinate { get; set; }

   // Auto-Property mit Initialisierer

   public double YCoordinate { get; set; } = 100.0;
}
```

---

###Konstruktor
Konstruktoren sind haupsächlich konzeptioniert, um instanzen von Klassen zu erzeugen. Es gibt die Möglichkeit, Konstruktoren mit einem oder mehrere Parameter zu entwerfen, welche die Initialisierung von Eigenschaften vereinfacht.  

```cs

class Circle
{

   private int Radius { get; set; }
   private double XCoordinate { get; set; }
   private doouble YCoordinate { get; set; }


   public Circle (int r, double x, double y){
   
   Radius = r;
   XCoordinate = x;
   YCoordinate = y;

   }
}

Circle c1 = new Circle(12, 12.0, 25.0);

```

####Überladung (Overload)
Innerhalb einer Klasse dürfen mehrere Konstruktoren implementiert werden, wenn sich diese in der Anzahl der Argumente oder in der Art der Datentypen ihrer Argumente unterscheiden.

```cs

class Circle
{

   private int Radius { get; set; }
   private double XCoordinate { get; set; }
   private doouble YCoordinate { get; set; }


   public Circle (int r, double x, double y){
   
   Radius = r;
   XCoordinate = x;
   YCoordinate = y;

   }

   public Circle(int r, double y) : this (r, 0, y) { }
   public Circle(int r) : this (r, 0, 0) { }
   public Circle() : this (12, 0, 0) { }
}



Circle c1 = new Circle(12, 12.0, 25.0);
Circle c2 = new Circle(12, 12.0);
Circle c3 = new Circle(12);
Circle c4 = new Circle();

```

---

###Methode

####Parameter
Parameter sind lokale Variablen und stehen als Platzhalter für beliebige Werte (Argumente), welche zum Zeitpunkt des Aufrufs an die Methode übergeben werden. 

```cs
// Methode und Parameter

private void EineMethode(string parameter1, string parameter2)
{
   // Nur der lokale Code hat Zugriff auf die lokalen Variablen(parameter1, parameter2)
}

// Aufrufs Methode und Argumenten

EineMethode("Argument1", "Argument2"); 
```

Eine Methode kann jeweils nur einen Wert (oder eine Referenz) zurückgeben. Die Rückgabe mehrerer Werte ist nicht möglich.

####Variabilität der Argumente

**Optionale Parameter**

```cs
var resultat = Berechne(2, 3);
var resultat2 = Berechne(2);
```

**Benannte optionale Parameter**

```cs
var resultat3 = Berechne(2, c: 55, b: 100);
```

```cs
public int Berechne(int a, int b = 2, int c = 2)
{
   var resultat = a + b + c;
   return resultat;
}
```

**Beliebig viele Argumente**

```cs
var resultat = Berechne(2,3,4,1,5);
var resultat2 = Berechne(2);
```

```cs
public int Berechne(int a, params int[] zahlen)
{
  int resultat = +a;
  foreach (var z in zahlen)
  {
      resultat += z;
  }
  return resultat;
}
```

####Kopie per Wert
Werden von elementaren / Atomare Datentypen wie byte, int, string, u.s.w. an eine Methode übergeben, wird von den Werten eine KOPIE in die Parametervariablen erstellt. Man spricht vom Konzept "copy by value".

```cs
int x = 10;
int y = 12;

TauschWerte(x, y);

private void TauschWerte(int a, int b)
{
   int temp = a;
   a = b;
   b = temp;
}
```

####Kopie per Referenz
Möchte man, dass Veränderungen in der Methode eine Rückwirkung auf die originalen Variablen haben, müssen diese per REFERENZ an die Methode übergeben werden. Das Konzept lautet "copy by reference". Das notwendige Schlüsselwort vor den Parametern lautet ref.  

```cs
int x = 10;
int y = 12;

TauschWerte(ref x, ref y);

private void TauschWerte(ref int a, ref int b)
{
   int temp = a;
   a = b;
   b = temp;
}
```
Datenfelder/Datenstrukturen(Arrays) gehören zu den sogenannten Verweistypen. Variablen dieser Typen werden automatisch und immer per Referenz an eine Methode übergeben(copy by reference). Somit kann auf das Schlüsselwort ref verzichtet werden.

Warum ist das so ?
Warum sind die Arrays bereits referenziert?
Sind es auch Objekte?

---

###Namensräume
Namensräume kategorisieren Klassen, um das Auffinden einer bestimmten Funktionalität auf ein Minimum zu reduzieren und Mehrdeutigkeiten zu vermeiden.
Namensräume lassen sich gut mit der Ordnerstruktur eines Dateisystems vergleichen. Dabei ähnelt ein Namenspace einem Verzeichnis.

```cs
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing; 
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SysForm = System.Windows.Froms;

namespace Demo
{
   public partial class Form1: SysForm
   {
      public From1()
      {
         InitializeComponent();
      }
   }
}

```

---

###Operatoren
Ein Ausdruck ist die kleinste ausführbare Einheit eines Programms und setzt mindestens einen Operator voraus.
```cs
// Ausdruck

     int value      =         22;
//  | Operant | Operator | Operant |
```
Ein **Ausdruck** wird immer aus mindestens einem Operanden und einem Operator gebildet. Der Operator im Beispiel oben ist der Zuweisungsoperator, als Operand gilt sowohl die Konstante "22" als auch die Variable "int value". Operatoren verknüpfen Operanden miteinander und führen Berechnungen durch. 


####Arithmetische Operatoren
| **Operator** | **Beschreibung** |
|----------|-------------|
| + | Hat zwei Funktionalitäten: Als Additionsoperator bildet er die Summe zweier Operanden (x + y). Als Vorzeichenoperator beschreibt er eine positive Zahl (+x), ist also ein einstelliger (unärer) Operator. |
| - | Hat ebenfalls zwei Funktionalitäten: Als Subtraktionsoperator eingesetzt, bildet er die Differenz zweier Operanden (x - y). Als unärer Vorzeichenoperator beschreibt er eine negative Zahl (-x). |
| * | Multiplikationsoperator; multipliziert zwei Operanden (x * y). |
| / | Divisionsoperator; dividiert zwei Operanden (x / y), behält den Nachkommateil der Division. |
| % | Restwertoperator; dividiert zwei Operanden und liefert als Ergebnis den Restwert der Operation (x % y). |
| ++ | Erhöht den Inhalt des Operanden um 1. Das Ergebnis der Operation ++x ist der Wert des Operanden nach der Erhöhung. Das Ergebnis der Operation x++ ist der Wert des Operanden vor der Erhöhung. |
| -- | Verringert den Inhalt des Operanden um 1. Das Ergebnis der Operation --x ist der Wert des Operanden nach der Verringerung. Das Ergebnis der Operation x-- ist der Wert des Operanden vor der Verringerung. |


####Vergleichsoperatoren
| **Operator** | **Beschreibung** |
|----------|-------------|
| a == b | Prüft, ob der Ausdruck `a` dem Ausdruck `b` entspricht, und gibt in diesem Fall `true` zurück. |
| a != b | Ergebnis der Operation ist `true`, wenn `a` ungleich `b` ist. |
| a > b | Ergebnis der Operation ist `true`, wenn `a` größer `b` ist. |
| a < b | Ergebnis der Operation ist `true`, wenn `a` kleiner `b` ist. |
| a <= b | Ergebnis der Operation ist `true`, wenn `a` kleiner oder gleich `b` ist. |
| a >= b | Ergebnis der Operation ist `true`, wenn `a` größer oder gleich `b` ist. |


####Logische Operatoren
| **Operator** | **Beschreibung** |
|----------|-------------|
| ! | Unärer Negationsoperator. Der Ausdruck `!a` ist `true`, wenn `a` einen unwahren Wert beschreibt, und `false`, wenn `a` wahr ist. |
| & | (And-Operator, 1. Variante) Der Ausdruck `a & b` ist dann `true`, wenn sowohl `a` als auch `b` `true` sind. Dabei werden in jedem Fall beide Ausdrücke ausgewertet. |
| \| | (Or-Operator, 1. Variante) Der Ausdruck `a | b` ist `true`, wenn entweder `a` oder `b` wahr ist. Dabei werden in jedem Fall beide Ausdrücke ausgewertet. |
| ^ | (Xor-Operator) Der Ausdruck `a ^ b` ist `true`, wenn die beiden beteiligten Operanden unterschiedliche Wahrheitswerte haben. |
| && | (And-Operator, 2. Variante) Der Ausdruck `a && b` ist `true`, wenn sowohl `a` als auch `b` `true` sind. Zuerst wird `a` ausgewertet. Sollte `a` `false` sein, ist in jedem Fall der Gesamtausdruck unabhängig von `b` auch `false`. `b` wird dann nicht mehr ausgewertet. |
| \|\| | (Or-Operator, 2. Variante) Der Ausdruck `a || b` ist `true`, wenn entweder `a` oder `b` `true` ist. Zuerst wird `a` ausgewertet. Sollte `a` bereits `true` sein, ist in jedem Fall der Gesamtausdruck unabhängig von `b` auch `true`. `b` wird dann nicht mehr ausgewertet. |

---

###Rekursion

Methoden kapseln Code für die Wiederverwendung und vermeiden letzlich auch die Redundanz von Quellcode. 

Methoden können andere Methoden aufrufen. Dies wird als verschachtelter Aufruf bezeichnet. Das Programm kehrt jeweils; aus einer beliebigen Schachtelungstiefe; zur aufgerufenen Stelle zurück.
Methoden können sich auch selbst aufrufen!
Dieser Vorgang wird Rekursion genannt.
Eine rekursive Methode muss jedoch eine Verzweigung (bedingte Anweisung) enthalten, welche die die Rekursion wieder beendet,da es sonst zu einer endlosen kette von Selbstaufrufen kommen würde. 
Es gibt Probleme, die mit rekursiven Aufrufen "eleganter" gelöst werden können als ohne.
Die meisten Probleme lassen sich jedoch auch ohne Rekursion lösen. 

```cs
private void Divide(ref double z) 
{
   z /= 2;
   if(z>0.1)
   {
      Console.WriteLine("x: " + x + "\r\n");

      Divide(ref z);
   }
}
```

---

###Referenzen Vergleiche + Typen

####Objekterzeugung aus Klassen
Wenn aus Klassen Objekte erzeugt werden, sieht die allgemeine Syntax so aus:

```cs
Person p1 = new Person("Max", "Muster", 23);
```
- `Person` ist der **Datentyp** (die Klasse)
- `p1` ist die **Objektvariable**
- `new` ist das **Schlüsselwort** zur Instanziierung eines neuen Objekts
- Der **Konstruktor** `Person("Max", "Muster", 23)` wird aufgerufen, um ein neues Objekt zu erzeugen

####Wertetypen vs. Referenztypen
In C# gibt es **Wertetypen** und **Referenztypen**:

**Beispiel für einen Wertetyp:**
```cs
int a = 12;
int b = a; // Kopie des Wertes von a wird in b gespeichert
b = 99;
// a bleibt unverändert
```
Hier wird der Wert von `a` direkt in `b` kopiert. Eine Änderung von `b` hat keinen Einfluss auf `a`.

**Beispiel für einen Referenztyp:**
```cs
Person a = new Person("Max", "Muster", 23);
Person b = a; // b speichert die Referenz auf dasselbe Objekt
b.Firstname = "Petra";
// Die Änderung betrifft sowohl `b` als auch `a`, da beide auf dasselbe Objekt zeigen
```
Hier zeigt `b` auf dasselbe Objekt wie `a`. Eine Änderung über `b` wirkt sich auch auf `a` aus.

####Vergleich von Objekten
Vergleicht man Objekte mit `==`, prüft man nur, ob beide Variablen auf dasselbe Objekt zeigen.
Ein inhaltlicher Vergleich muss über eine eigene Methode erfolgen:

```cs
public bool Equals(Person other)
{
    if (other == null)
        return false;
    if (Firstname == other.Firstname &&
        Lastname == other.Lastname &&
        Age == other.Age)
        return true;
    return false;
}
```
Diese Methode vergleicht die Werte der Felder und prüft, ob zwei Objekte inhaltlich gleich sind.

####Löschen einer Referenz
Eine Objektvariable kann durch `null` von einer Referenz getrennt werden:

```cs
Person a = new Person("Max", "Muster", 23);
Person b = a;
a = null; // a zeigt nun nicht mehr auf das Objekt
// b zeigt aber weiterhin auf das Objekt
```
Hier wird `a` von der Referenz getrennt, aber `b` zeigt weiterhin auf das ursprüngliche Objekt.

---

###Sammlungen
|**Feste Grösse**|**Flexible Grösse**|
|:---------------|:-----------------|
| Array | ArrayList <br> List <br> Hashtable <br> Dictionary <br> Etc. |


####Feste Grösse 
Eine feste Grösse ist, wie der Name schon sagt, eine Grösse, die immer gleich bleibt, unabhängig davon, ob ein Wert eingegeben wird oder nicht. Wenn also z.B. in einem Array ein Element entfernt wird, bleibt ein leerer Index zurück.

####Flexible Grösse
Sammlungen flexibler Grösse sind Klassen, die ähnlich wie ein Array als Container für Elemente gleichen Typs dienen. 
Der Unterschied besteht darin, dass diese Klassen eine dynamische Grösse haben. Sie wachsen mit der Anzahl der Einträge und haben keine "leeren" Indizes.
Klassen werden auch Sammlungen, Auflistungen oder Listen genannt.

| **Sammlung**         | **Beschreibung** |
|----------------------|-----------------|
| **ArrayList**       | Diese Liste ist wohl die universellste. Sie nimmt beliebige Objekte auf und gestattet den wahlfreien Zugriff auf die Listenelemente. |
| **BitArray**        | Verwaltet ein Array von Bits. |
| **CollectionsUtil** | Eine Auflistung, bei der keine Unterscheidung zwischen Groß- und Kleinschreibung erfolgt. |
| **Hashtable**       | Die Elemente werden als Schlüssel-Wert-Paare gespeichert. Der Zugriff auf die Elemente erfolgt über den jeweiligen Schlüssel. |
| **HybridDictionary** | Das Verhalten orientiert sich an der Anzahl der Listenelemente. Ist die Anzahl der Elemente gering, operiert diese Klasse als ListDictionary-Collection, wird die Anzahl größer, als Hashtable. |
| **ListDictionary**  | Solange die Anzahl der Elemente kleiner als zehn ist, werden die Operationen mit den Elementen schneller ausgeführt als bei einer Hashtable. |
| **NameValueCollection** | Verwaltet ein Schlüssel-Wert-Paar, wobei sowohl der Schlüssel als auch der Wert durch Zeichenfolgen beschrieben werden. Einem Schlüssel können mehrere Zeichenfolgen zugeordnet werden, d. h., der Schlüssel ist nicht eindeutig. |
| **SortedList**      | Diese Auflistung verwaltet Schlüssel-Wert-Paare, die nach den Schlüsseln sortiert sind und auf die sowohl über Schlüssel als auch über Indizes zugegriffen werden kann. Damit vereint sie die Merkmale von Hashtable und ArrayList. |
| **StringCollection** | Eine Auflistung, die nur Zeichenfolgen enthält. |
| **StringDictionary** | Ähnlich einer Hashtable; der Schlüssel ist jedoch immer eine Zeichenfolge. |



####Array
Mit einem Array können Werte in einer Variablen mit einer vordefinierten Menge von Werten gespeichert werden. Deshalb spricht man von einer festen Grösse.

```cs
//Deklarierung und Instanziierung

Datentyp[] bezeichner = new Datentyp[Grösse];

//Werte zuweisen / auslesen 


// Variante 1

int[] data = new int[10];
data[0] = 123;
data[1] = 456;


// Variante 2

int[] data2 = {123, 456};


// Abrufen
TxtValue1.Text = Convert.ToString(data[0]); // Output: 123

TxtValue2.Text = Convert.ToString(data2.Length); // Output: 2
```

| **Eigenschaft**             | **Verhalten**                             |
|----------------------------|------------------------------------------|
| `irgendeinArray.Length`    | Besagt, wie gross ein Array ist         |

| **Methode**                              | **Verhalten**                                                |
|------------------------------------------|-------------------------------------------------------------|
| `irgendeinArray.Clone()`                 | Erstellt eine flache Kopie eines Arrays und liefert die Kopie |
| `Array.IndexOf(einArray, gesuchterWert)` | Sucht einen Wert in einem Array und liefert dessen Position zurück |
| `Array.Sort(irgendeinArray)`             | Sortiert ein Array aufsteigend |

####Mehrdimensionale Arrays 
Es wird ein zweidimensionales Array aufgebaut, in welchen eine Dimension den Orten und in der anderen Dimension den Werten zugewiesen werden.

```cs

//Deklarierung und Instanziierung

int[,] TwoDimensionalData = new int[3, 3];

// Variante 1 

TwoDimensionalData[0,0] = 1;

// Variante 2

int[,] TwoDimensionalData2 = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

//Abrufen mit GetUpperBound() Methode

for (int y = 0; y <= data.GetUpperBound(0); y++)
{
   for (int x = 0; x <= data.GetUpperBound(1); x++)
   {
       TxtValue1.Text = Convert.ToString(TwoDimensionalData2[x,y]);
   }
}

```

####ArrayList + List

- `ArrayList` und `List<T>` sind dynamische Listen, die in ihrer Grösse wachsen können.
- Erlauben den Zugriff auf Elemente über Indizes
- Implementiert das IList-Interface.
- Standardmässig eine Kapazität von 0, bevor ein Element hinzugefügt wird. 
- Die Speicherkapazität erhöht sich von 0 auf 4 und verdoppelt sich. 
  Warum geschieht das ?  
  Warum verdoppelt sich die Speicherkapazität ?  
  Handelt es sich um neue Arrays mit festen Grössen ?  
  Was geschieht mit den alten, kleineren und ihren Werten ?  

```cs

// Bei List

List<string> list = new List<sting>(); 
list.Add("Werner");
int anzahl = list.Count; // Anzahl gespeicherter Elemente

List<string> list2 = new List<string> { "Peter", "Andreas", "Conie", "Michael", "Gerd", "Hodor", "Katara"};
list2.Remove("Andreas");        // Entfernt Objekt Andreas
list2.RemoveAt(0);              // Entfernt das erste Objekt in der Sammlung
list2.Clear();                  // Löscht alle Elemente
list2.Insert(0, "Manfred");     // Wird an erster Stelle eingefügt.




// Bei ArrayList

ArrayList list = new ArrayList();

// Praktisch die gleichen Funktionalitäten wie die List 
// Unterschied zu List Speichert Elemente vom Typ Object

```
 
####Dictionary + Hashtable
- Implementiert das Interface "IDictionary"
- Verwenden anstelle eines Index ein Schlüssel
- Der Schlüssel darf nicht mehrfach vorkommen

```cs

// Dictionary

var dic = new Dictionary<string, string>();
dic.Add("one","Dog");
dic.Add("two","Cat");
dic.Remove("two");

int anz = dic.Count; // Anzahl gespeicherter Elemente

foreach (string element in dic.Values) {
   Console.WriteLine(element + ", "); // Liefert Elemente
}

foreach (string key in dic.Keys) {
   Console.WriteLine(key + ", ");  // Liefert Keys
}



// Hashtable

Hashtable hash = new Hashtable();
hash.Add("one", "Dog");
hash.Add("two", "Cat");
hash.Remove("two");

// Praktisch die gleichen Funktionalitäten wie das Dictionary
// Unterschied zum Dictionary: Schlüssel und Wert sind vom Typ Object

```

**Unterschiede im Detail**  

| **Dictionary** | **Hashtable** |
|--------------|--------------|
| Das Wörterbuch ist ein generisches Wörterbuch `<TKey, TValue>` | Hashtable ist ein nicht generischer Typ |
| Die Dictionary-Klasse ist ein starker Typ `<TKey, TValue>`. Daher müssen Sie die Datentypen für Schlüssel und Wert angeben. | Hashtable ist eine schwach typisierte Datenstruktur, sodass Sie Schlüssel und Werte eines beliebigen Objekttyps hinzufügen können. |
| Boxen / Unboxen ist nicht erforderlich. | Werte müssen Boxing / Unboxing erhalten. |
| Wenn Sie versuchen, auf ein nicht vorhandenes Schlüssel-Wörterbuch zuzugreifen, tritt ein Laufzeitfehler auf. | Wenn Sie versuchen, auf nicht vorhandene Schlüssel-Hashtable zuzugreifen, werden Nullwerte angegeben. |
| Dictionary behält eine Reihenfolge der gespeicherten Werte bei. | Hashtable behält niemals eine Reihenfolge der gespeicherten Werte bei. |
| Das Wörterbuch wird unter `System.Collections.Generic` Namespace definiert. | Hashtable ist im Namespace `System.Collections` definiert. |

####Boxing/Unboxing

| **Boxing** | **Unboxing** |
|------------|-------------|
| **Definition:** Der Prozess, bei dem ein Werttyp (z. B. `int`) in einen Referenztyp (z. B. `object`) umgewandelt wird. | **Definition:** Hier wird das Objekt zurück in den ursprünglichen Wertetyp gewandelt. |
| **Beispiel:** | **Beispiel:** |
| `int y = 9;` <br> `object obj = y;` | `int c = (int)obj;` |

---

###Statische Elemente


####Statische Variablen
In C# können Werte in **statischen Elementen** einer Klasse gespeichert werden. Diese benötigen **keine Instanzierung** eines Objekts.

```cs
public class Person
{
    private string vorname;
    private string nachname;
    private string alter;
    
    private static int counter; // Statische Klassenvariable
}
```

- **Normale Instanzvariablen**: Der Wert wird erst nach einer Instanziierung eines Objekts gespeichert.
- **Statische Variablen**: Der Wert wird direkt in der Klasse gespeichert und bleibt für alle Instanzen gleich.

####Statische Methoden
Um Werte in einer statischen Variable zu speichern, benötigt man **statische Methoden**. Diese Methoden arbeiten auf Klassenebene.

```cs
public class Person
{
    private static int counter;
    
    public static int Counter
    {
        get { return counter; }
        set { counter = value; }
    }
}
```

Ein Beispiel für die Nutzung einer statischen Methode:

```cs
Person.Counter = 12;
TxtBox.Text = Convert.ToString(Person.Counter);
```

####Statische Methoden in der .NET-Klassenbibliothek
Viele Methoden in .NET sind **statisch**, da sie keinen Zustand speichern müssen. Ein Beispiel ist die `Math`-Klasse:

```cs
TxtBox.Text = Math.Round(2.56).ToString(); // Gibt "3" zurück
```

- **Vorteil**: Man muss keine Instanz der Klasse erstellen, um die Methode zu nutzen.

####Statische Klassen 
Es ist möglich, ganze Klassen als `static` zu deklarieren. Diese enthalten nur statische Methoden und Felder und **können nicht instanziiert** werden.

```cs
public static class MathHelper
{
    public static double Add(params double[] values)
    {
        // Implementierung ausgelassen
    }
    
    public static double Subtract(params double[] values)
    {
        // Implementierung ausgelassen
    }
}
```
---

###Typenkonvertierungen
Wenn ein Wert eines bestimmten Typs in einen anderen Typ umgewandelt werden soll, spricht man von Typkonvertierungen oder in engl. type conversion bzw. type casting

|**Name**|**Beschreibung**|**Beispiel**|
|:---|:---|:---|
| **Implizite Typenkonvertierung** | Der Compiler übernimmt die Umwandlung des ursprünglichen Typs zum Zieltyp automatisch. | ```int zahl1 = 33;``` <br> ```long zahl2 = zahl1;```|
| **Explizite Typenkonvertierung** | Der Programmierer muss den Compiler dazu "zwingen", den ursprünglichen Typen in einen Zieltypen umzuwandeln. | ```long zahl3 = 44;``` <br> ```int zahl4 = (int)zahl3;```|


Warum ist das so ?  
Warum funktioniert es von ```int``` zu ```long```, aber nicht umgekehrt ?

---


###Vererbung

- Eine Klasse kann Eigenschaften und Methoden einer anderen Klasse erben.
- Erhöht Code-Wiederverwendbarkeit und ermöglicht Spezialisierung.
- In C# erfolgt die Vererbung mit `:`.

####Beispiel für Vererbung
```cs
class Mathematic 
{
    public int Add(int a, int b) => a + b;
}

class ExtMath : Mathematic 
{
    public int Sqr(int a) => a * a;
}
```

####Methodensuche bei Vererbung
1. Methode wird zuerst in der aktuellen Klasse gesucht.
2. Falls nicht vorhanden, in der Basisklasse.
3. Suche geht weiter, bis `Object` erreicht wird.

####Konstruktoren und `base`-Aufrufe
- Konstruktoren werden nicht vererbt.
- Muss explizit mit `base()` aufgerufen werden.

```cs
class Fahrzeug
{
    protected string bezeichnung;
    public Fahrzeug(string b) { bezeichnung = b; }
}

class Pkw : Fahrzeug
{
    public Pkw(string b) : base(b) {}
}
```

####Sichtbarkeit (`private`, `protected`, `public`)
- `private`: Kein Zugriff in der Unterklasse.
- `protected`: Zugriff in Unterklassen erlaubt.
- `public`: Voller Zugriff.

```cs
class Fahrzeug
{
    protected string bezeichnung;
}
class Pkw : Fahrzeug
{
    public string GibDaten() => bezeichnung;
}
```

####Aufruf von Basisklassenmethoden
- `base.Methodenname()` ermöglicht den Zugriff auf eine Methode der Basisklasse.

```cs
public override string GibDaten()
{
    return base.GibDaten() + ", mit Erweiterung";
}
```

####Typenumwandlung in der Vererbung
- Objekte einer Unterklasse können einer Basisklasse zugewiesen werden (implizite Konvertierung).

```cs
DVD dvd = new DVD();
Medium m = dvd; // Erlaubt, da DVD von Medium erbt.
```

####Polymorphismus und Vererbungsstruktur
- Eine Sammlung kann generisch auf die Basisklasse zugreifen und unterschiedliche Subtypen enthalten.

```cs
public class Datenbank
{
    private Medium[] medien = new Medium[100];
}
```
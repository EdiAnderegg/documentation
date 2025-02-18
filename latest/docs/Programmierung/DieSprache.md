#Die Sprache

**Die Sprache im allgemeinen Sinne ist wahrscheinlich eines der wichtigsten Mittel des Menschen zur Sammlung von Informationen und vor allem zur Weitergabe von Informationen an andere in verständlicher und strukturierter Form.**  

**Ist die Sprache eine der ersten Normen, die der Mensch entwickelt hat?**

Wie in jedem Beruf gibt es auch im IT-Bereich eine Sprache!
Die Informatik hat sich in den letzten Jahrzehnten rasant entwickelt und ist zu einem grundlegenden und wichtigen Bestandteil des täglichen Lebens geworden. 
Um mit der heutigen Komplexität der IT Schritt zu halten und sie unter Kontrolle zu behalten, hat sich die IT in klare Sektoren aufgeteilt. So hat jeder Sektor seine eigene Sprache entwickelt, wie z.B. der Sektor der Softwareentwicklung!

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


   // Getters und Setters
   public string MyPublicProperty { get; set; }


   private string MyPrivateProperty { get; set; }

   
   // Methoden
   public void MyPublicMethod(){}


   private void MyPrivateMethod(){}
   
}
```
 

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


###Fehler


####Syntaktischer Fehler
Dies sind Fehler, welche eine Verletzung der "Grammatik" der Sprache aufweisen.
```cs
int number = "Hello"; // ❌ Error: Cannot implicitly convert type 'string' to 'int'
```


####Logischer Fehler
Der Code ist syntaktisch korrekt und die IDE (Integrated Development Environment) oder der Code-Editor melden keine Fehler. Erst wenn das Programm ausgeführt wird, liefert es unerwartet Ausgaben oder akzeptiert unerwartete Eingaben! 
```cs
using System;

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


###Operatoren
Ein Ausdruck ist die kleinste ausführbare Einheit eines Programms und setzt mindestens einen Operator voraus.
```cs
// Ausdruck

     int value      =         22;
//  | Operant | Operator | Operant |
```
Ein Ausdruck wird immer aus mindestens einem Operanden und einem Operator gebildet. Der Operator im Beispiel oben ist der Zuweisungsoperator, als Operand gilt sowohl die Konstante "22" als auch die Variable "int value". Operatoren verknüpfen Operanden miteinander und führen Berechnungen durch. 

####Arithmetische Operatoren
| Operator | Beschreibung |
|----------|-------------|
| + | Hat zwei Funktionalitäten: Als Additionsoperator bildet er die Summe zweier Operanden (x + y). Als Vorzeichenoperator beschreibt er eine positive Zahl (+x), ist also ein einstelliger (unärer) Operator. |
| - | Hat ebenfalls zwei Funktionalitäten: Als Subtraktionsoperator eingesetzt, bildet er die Differenz zweier Operanden (x - y). Als unärer Vorzeichenoperator beschreibt er eine negative Zahl (-x). |
| * | Multiplikationsoperator; multipliziert zwei Operanden (x * y). |
| / | Divisionsoperator; dividiert zwei Operanden (x / y), behält den Nachkommateil der Division. |
| % | Restwertoperator; dividiert zwei Operanden und liefert als Ergebnis den Restwert der Operation (x % y). |
| ++ | Erhöht den Inhalt des Operanden um 1. Das Ergebnis der Operation ++x ist der Wert des Operanden nach der Erhöhung. Das Ergebnis der Operation x++ ist der Wert des Operanden vor der Erhöhung. |
| -- | Verringert den Inhalt des Operanden um 1. Das Ergebnis der Operation --x ist der Wert des Operanden nach der Verringerung. Das Ergebnis der Operation x-- ist der Wert des Operanden vor der Verringerung. |

####Vergleichsoperatoren
| Operator | Beschreibung |
|----------|-------------|
| a == b | Prüft, ob der Ausdruck `a` dem Ausdruck `b` entspricht, und gibt in diesem Fall `true` zurück. |
| a != b | Ergebnis der Operation ist `true`, wenn `a` ungleich `b` ist. |
| a > b | Ergebnis der Operation ist `true`, wenn `a` größer `b` ist. |
| a < b | Ergebnis der Operation ist `true`, wenn `a` kleiner `b` ist. |
| a <= b | Ergebnis der Operation ist `true`, wenn `a` kleiner oder gleich `b` ist. |
| a >= b | Ergebnis der Operation ist `true`, wenn `a` größer oder gleich `b` ist. |

####Logische Operatoren
| Operator | Beschreibung |
|----------|-------------|
| ! | Unärer Negationsoperator. Der Ausdruck `!a` ist `true`, wenn `a` einen unwahren Wert beschreibt, und `false`, wenn `a` wahr ist. |
| & | (And-Operator, 1. Variante) Der Ausdruck `a & b` ist dann `true`, wenn sowohl `a` als auch `b` `true` sind. Dabei werden in jedem Fall beide Ausdrücke ausgewertet. |
| \| | (Or-Operator, 1. Variante) Der Ausdruck `a | b` ist `true`, wenn entweder `a` oder `b` wahr ist. Dabei werden in jedem Fall beide Ausdrücke ausgewertet. |
| ^ | (Xor-Operator) Der Ausdruck `a ^ b` ist `true`, wenn die beiden beteiligten Operanden unterschiedliche Wahrheitswerte haben. |
| && | (And-Operator, 2. Variante) Der Ausdruck `a && b` ist `true`, wenn sowohl `a` als auch `b` `true` sind. Zuerst wird `a` ausgewertet. Sollte `a` `false` sein, ist in jedem Fall der Gesamtausdruck unabhängig von `b` auch `false`. `b` wird dann nicht mehr ausgewertet. |
| \|\| | (Or-Operator, 2. Variante) Der Ausdruck `a || b` ist `true`, wenn entweder `a` oder `b` `true` ist. Zuerst wird `a` ausgewertet. Sollte `a` bereits `true` sein, ist in jedem Fall der Gesamtausdruck unabhängig von `b` auch `true`. `b` wird dann nicht mehr ausgewertet. |


###Typenkonvertierungen
Wenn ein Wert eines bestimmten Typs in einen anderen Typ umgewandelt werden soll, spricht man von Typkonvertierungen oder in engl. type conversion bzw. type casting

|Name|Beschreibung|Beispiel|
|:---|:---|:---|
| **Implizite Typenkonvertierung** | Der Compiler übernimmt die Umwandlung des ursprünglichen Typs zum Zieltyp automatisch. | ```int zahl1 = 33;``` <br> ```long zahl2 = zahl1;```|
| **Explizite Typenkonvertierung** | Der Programmierer muss den Compiler dazu "zwingen", den ursprünglichen Typen in einen Zieltypen umzuwandeln. | ```long zahl3 = 44;``` <br> ```int zahl4 = (int)zahl3;```|


Warum ist das so ?  
Warum funktioniert es von ```int``` zu ```long```, aber nicht umgekehrt ?  



 



#Die Sprache

**Die Sprache im allgemeinen Sinne ist wahrscheinlich eines der wichtigsten Mittel des Menschen zur Sammlung von Informationen und vor allem zur Weitergabe von Informationen an andere in verständlicher und strukturierter Form.**  

**Ist die Sprache eine der ersten Normen, die der Mensch entwickelt hat?**

Wie in jedem Beruf gibt es auch im IT-Bereich eine Sprache!
Die Informatik hat sich in den letzten Jahrzehnten rasant entwickelt und ist zu einem grundlegenden und wichtigen Bestandteil des täglichen Lebens geworden. 
Um mit der heutigen Komplexität der IT Schritt zu halten und sie unter Kontrolle zu behalten, hat sich die IT in klare Sektoren aufgeteilt. So hat jeder Sektor seine eigene Sprache entwickelt, wie z.B. der Sektor der Softwareentwicklung!

---

###Deklaration
Um sicherzustellen, dass genügend Speicherplatz für einen Wert reserviert ist, müssen Variablen deklariert werden.
Eine Deklaration legt fest, welche Art von Wert gespeichert werden soll und wie viel Platz für den Wert reserviert werden soll.


###Syntaktischer Fehler
Dies sind Fehler, welche eine Verletzung der "Grammatik" der Sprache aufweisen.
```cs
int number = "Hello"; // ❌ Error: Cannot implicitly convert type 'string' to 'int'
```

###Logischer Fehler
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


